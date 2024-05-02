import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/models/note_model.dart';
import 'package:notsapp/views/widgets/App_bar_Edit_View.dart';
import 'package:notsapp/views/widgets/custom_text_field.dart';
import 'package:notsapp/views/widgets/edit_note_colors_list_view.dart';

import '../combonants/Widget.dart';
import '../combonants/my_Card.dart';
import '../cubits/notes_cubit/notes_cubit.dart';

class EditScreen extends StatefulWidget {
  final NoteModel? note;

  const EditScreen({this.note, Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState(note);
}

class _EditScreenState extends State<EditScreen> {
  NoteModel? note;
  var titleController = TextEditingController(text: "My Title");
  var contentController = TextEditingController();

  _EditScreenState(this.note) {
    titleController.text = note != null ? note!.title : "Title";
    contentController.text = note != null ? note!.subTitle : "";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Background(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 700) {
              return MobileEditingLayout(
                  widget.note, titleController, contentController);
            } else {
              return Container();
            }
          }),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}

class MobileEditingLayout extends StatefulWidget {
  final NoteModel? note;
  final TextEditingController titleController;
  final TextEditingController contentController;

  const MobileEditingLayout(
      this.note, this.titleController, this.contentController,
      {Key? key})
      : super(key: key);

  @override
  State<MobileEditingLayout> createState() => _MobileEditingLayoutState();
}

class _MobileEditingLayoutState extends State<MobileEditingLayout> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: CustomAppBarEdit(
              onPressed: () {
                widget.note!.title = title ?? widget.note!.title;
                widget.note!.subTitle = content ?? widget.note!.subTitle;
                widget.note!.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              icon: Icons.check,
              title: 'Edit Notes'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomEditTextField(
              onChanged: (value) {
                title = value;
              },
              maxLines: 1,
              maxLenght: null,
              controller: widget.titleController,
              hint: widget.note!.title),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: h6(
            '${(widget.note?.date)}',
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 15),
            child: MyCard(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 10, bottom: 10),
                child: CustomTextField(
                    onChanged: (value) {
                      content = value;
                    },
                    controller: widget.contentController,
                    maxLines: 20,
                    hint: widget.note!.subTitle),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 70,
          child: EditNoteColorsList(
            note: widget.note!,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
