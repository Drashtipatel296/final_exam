import 'package:final_exam/controller/database_controller.dart';
import 'package:final_exam/model/notes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final NotesModel notes;

  const HomeScreen({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final NotesController taskController = Get.put(NotesController());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.note_add_outlined),
        title: Text(
          'Notes',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.more_vert),
          ),
        ],
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: taskController.notes.length,
          itemBuilder: (context, index) {
            final note = taskController.notes[index];
            return ListTile(
              title: Text(
                note.note!,
                style: const TextStyle(color: Colors.black),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      taskController.updateData(note);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      taskController.deleteData(note.id!);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Add Your Note',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        NotesModel newNote =
                            NotesModel(note: controller.text, id: null);
                        taskController.addData(newNote);
                        Get.back();
                      }
                    },
                    child: Text(
                      'Add',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
