import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/model/notes_model.dart';

class FirestoreHelper {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String collectionName = 'notes';

  // Add a new note
  Future<void> addNote(NotesModel note) async {
    try {
      await firestore.collection(collectionName).add(note.toMap());
      print('Note added successfully');
    } catch (e) {
      print('Error adding note: $e');
    }
  }

  // Update an existing note
  Future<void> updateNote(NotesModel note) async {
    try {
      await firestore.collection(collectionName).doc(note.id as String?).update(note.toMap());
      print('Note updated successfully');
    } catch (e) {
      print('Error updating note: $e');
    }
  }

  // Delete a note by ID
  Future<void> deleteNote(String noteId) async {
    try {
      await firestore.collection(collectionName).doc(noteId).delete();
      print('Note deleted successfully');
    } catch (e) {
      print('Error deleting note: $e');
    }
  }

  // Fetch all notes
  // Fetch all notes
  Future<List<NotesModel>> fetchNotes() async {
    try {
      QuerySnapshot snapshot = await firestore.collection(collectionName).get();
      return snapshot.docs.map((doc) {
        return NotesModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Error fetching notes: $e');
      return [];
    }
  }

}
