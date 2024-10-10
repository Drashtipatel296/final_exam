import 'package:final_exam/model/notes_model.dart';
import 'package:final_exam/helper/firestore_helper.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  var notes = <NotesModel>[].obs;
  final FirestoreHelper firestoreHelper = FirestoreHelper();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    notes.value = await firestoreHelper.fetchNotes();
  }

  void addData(NotesModel note) async {
    await firestoreHelper.addNote(note);
    fetchData();
  }

  void updateData(NotesModel note) async {
    await firestoreHelper.updateNote(note);
    fetchData();
  }

  void deleteData(String noteId) async {
    await firestoreHelper.deleteNote(noteId);
    fetchData();
  }
}
