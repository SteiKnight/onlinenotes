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
  void openNoteBox() {
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
                firestoreService.addNote(controller.text);

                //clear controller
                controller.clear();

                //pop dialog box
                Navigator.pop(context);
              },
              child: Text('Add'),
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
          onPressed: openNoteBox,
          child: Icon(
            Icons.add,
          ),
        ),
        backgroundColor: Colors.grey[7],
        body: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return NoteCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
