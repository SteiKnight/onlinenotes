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
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //Update: update notes given doc id
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //Delete: delete notes given doc id
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
