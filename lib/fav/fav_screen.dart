import 'package:final_exam/model/notes_model.dart';
import 'package:flutter/material.dart';

class LikedNotesScreen extends StatelessWidget {
  final List<NotesModel> likedNotes;

  const LikedNotesScreen({super.key, required this.likedNotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Notes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: likedNotes.length,
        itemBuilder: (context, index) {
          final note = likedNotes[index];
          return ListTile(
            title: Text(note.note!),
          );
        },
      ),
    );
  }
}
