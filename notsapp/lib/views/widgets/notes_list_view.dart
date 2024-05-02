import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../combonants/constants.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return notes.isEmpty
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(" create a new notes ",
                        style: TextStyle(color: Colors.white.withOpacity(0.7))),
                    const SizedBox(
                      height: 10,
                    ),
                    Shimmer.fromColors(
                        child: Image.asset(
                          'images/note.png',
                          width: 100,
                          color: Colors.white,
                        ),
                        baseColor: Colors.black,
                        highlightColor: kSecondPrimaryColor)
                  ]))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                physics: const BouncingScrollPhysics(),
                itemCount: notes.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: NoteItem(
                      note: notes[index],
                    ),
                  );
                });
      },
    );
  }
}
