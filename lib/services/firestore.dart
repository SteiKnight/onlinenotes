import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection from notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //Create: add new note
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }
  //Read: get notes from database
  //Update: update notes given doc id
  //Delete: delete notes given doc id
}
