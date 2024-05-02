import 'package:flutter/material.dart';
import 'package:notsapp/combonants/constants.dart';
import 'package:notsapp/views/widgets/add_note_bottom_sheet.dart';
import 'package:notsapp/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Colors.purple.withOpacity(0.9),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}
