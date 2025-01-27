import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onlinenotes/models/note_card.dart';
import 'package:onlinenotes/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final controller = TextEditingController();

  //firestore
  final FirestoreService firestoreService = FirestoreService();

  void deleteNote() {}
  void editNote() {}

  //open a dialog input box
  void openNoteBox({String? docID}) {
    String button;
    if (docID == null) {
      button = 'ADD';
    } else {
      button = 'UPDATE';
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: controller,
          ),
          actions: [
            //button to save
            ElevatedButton(
              onPressed: () {
                //add note
                if (docID == null) {
                  firestoreService.addNote(controller.text);
                } else {
                  firestoreService.updateNote(docID, controller.text);
                }

                //clear controller
                controller.clear();

                //pop dialog box
                Navigator.pop(context);
              },
              child: Text(button),
            ),
            //cancel button
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Notes',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openNoteBox();
          },
          child: Icon(
            Icons.add,
          ),
        ),
        backgroundColor: Colors.grey[7],
        body: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getNotesStream(),
                builder: (context, snapshot) {
                  //if we have data, get all the docs
                  if (snapshot.hasData) {
                    List notesList = snapshot.data!.docs;

                    //return a list view
                    return ListView.builder(
                      itemCount: notesList.length,
                      itemBuilder: (context, index) {
                        //get each individual doc
                        DocumentSnapshot document = notesList[index];
                        String docID = document.id;

                        //get note from each doc
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String noteText = data['note'];
                        //display a list tile
                        return NoteCard(
                          text: noteText,
                          edit: () => openNoteBox(docID: docID),
                          delete: () => firestoreService.deleteNote(docID),
                        );
                      },
                    );
                  }
                  //if there is no data
                  else {
                    return const Text("No notes...");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
