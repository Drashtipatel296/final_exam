import 'package:final_exam/helper/database_helper.dart';
import 'package:final_exam/model/notes_model.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  var notes = <NotesModel>[].obs;
  var likedNotes = <NotesModel>[].obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    notes.value = await dbHelper.fetch();
  }

  void addData(NotesModel note) async {
    await dbHelper.insertData(note);
    fetchData();
  }

  void updateData(NotesModel note) async {
    await dbHelper.update(note);
    fetchData();
  }

  void deleteData(int id) async {
    await dbHelper.delete(id);
    fetchData();
  }

  // Add note to likedNotes list
  void likeNote(NotesModel note) {
    if (!likedNotes.contains(note)) {
      likedNotes.add(note);
    }
  }

  // Remove note from likedNotes list
  void unlikeNote(NotesModel note) {
    likedNotes.remove(note);
  }
}