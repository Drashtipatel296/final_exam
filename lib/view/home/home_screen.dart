// import 'package:final_exam/controller/database_controller.dart';
// import 'package:final_exam/model/notes_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../fav/fav_screen.dart';
//
// class HomeScreen extends StatelessWidget {
//   final NotesModel notes;
//
//   const HomeScreen({super.key, required this.notes});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController controller = TextEditingController();
//     final NotesController taskController = Get.put(NotesController());
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.note_add_outlined),
//         title: Text(
//           'Notes',
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: IconButton(
//                 onPressed: () {
//                   Get.to(() => LikedNotesScreen(
//                         likedNotes: taskController.likedNotes,
//                       ));
//                 },
//                 icon: Icon(Icons.favorite_border_outlined)),
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: taskController.notes.length,
//           itemBuilder: (context, index) {
//             final note = taskController.notes[index];
//             return ListTile(
//               title: Text(
//                 note.note!,
//                 style: const TextStyle(color: Colors.black),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.edit),
//                     onPressed: () {
//                       controller.text = note.note!;
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Text(
//                               'Edit',
//                               style: GoogleFonts.poppins(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             content: TextField(
//                               controller: controller,
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                             actions: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   if (controller.text.isNotEmpty) {
//                                     note.note = controller.text;
//                                     taskController.updateData(note);
//                                     Get.back();
//                                   }
//                                 },
//                                 child: Text(
//                                   'Edit',
//                                   style: GoogleFonts.poppins(),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Obx(() {
//                       return Icon(
//                         taskController.likedNotes.contains(note)
//                             ? Icons.favorite
//                             : Icons.favorite_border_outlined,
//                       );
//                     }),
//                     onPressed: () {
//                       if (taskController.likedNotes.contains(note)) {
//                         taskController.unlikeNote(note);
//                       } else {
//                         taskController.likeNote(note);
//                       }
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed: () {
//                       taskController.deleteData(note.id!);
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text(
//                   'Add Your Note',
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 content: TextField(
//                   controller: controller,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 actions: [
//                   ElevatedButton(
//                     onPressed: () {
//                       if (controller.text.isNotEmpty) {
//                         NotesModel newNote =
//                             NotesModel(note: controller.text, id: null);
//                         taskController.addData(newNote);
//                         Get.back();
//                       }
//                     },
//                     child: Text(
//                       'Add',
//                       style: GoogleFonts.poppins(),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_exam/model/notes_model.dart';

import '../../controller/database_controller.dart';
import '../../fav/fav_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final NotesController taskController = Get.put(NotesController());

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.note_add_outlined),
        title: Text(
          'Notes',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => LikedNotesScreen(
                      likedNotes: taskController.likedNotes,
                    ));
              },
              icon: Icon(Icons.favorite_border_outlined)),
        ],
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
                      controller.text = note.note!;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Edit',
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
                                    note.note = controller.text;
                                    taskController.updateData(note);
                                    Get.back();
                                  }
                                },
                                child: Text(
                                  'Edit',
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: Obx(() {
                      return Icon(
                        taskController.likedNotes.contains(note)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                      );
                    }),
                    onPressed: () {
                      if (taskController.likedNotes.contains(note)) {
                        taskController.unlikeNote(note);
                      } else {
                        taskController.likeNote(note);
                      }
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
