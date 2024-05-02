import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/combonants/constants.dart';
import 'package:notsapp/views/edit_note_view.dart';
import 'package:shimmer/shimmer.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.question,
          animType: AnimType.rightSlide,
          title: 'Chose what Do you want ?',
          btnOkText: '(Read - Edit )',
          btnOkColor: Colors.blue,
          btnOkOnPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return EditScreen(
                  note: note,
                );
              }),
            );
          },
          btnCancelText: 'Delet',
          btnCancelOnPress: () {
            note.delete();

            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          },
        ).show();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(
          left: 4,
          top: 3,
          // bottom: 2,
          right: 4,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 110,
                  // height: 30,
                  child: Text(
                    note.title,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Shimmer.fromColors(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        iconlo,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    baseColor: Colors.black,
                    highlightColor: Colors.purple),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 18,
                      color: Colors.black.withOpacity(.6),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                right: 5,
                top: 20,
              ),
              child: Text(
                note.date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
            )

            // ListTile(
            //   title: Text(
            //     note.title,
            //     style: const TextStyle(
            //       fontSize: 20,
            //       color: Colors.black,
            //     ),
            //   ),
            //   subtitle:
            // Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 16),
            //     child:
            // Text(
            //       note.subTitle,
            //       style: TextStyle(
            //         fontSize: 18,
            //         color: Colors.black.withOpacity(.4),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24),
            //   child: Text(
            //     note.date,
            //     style: TextStyle(
            //       color: Colors.black.withOpacity(.4),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
