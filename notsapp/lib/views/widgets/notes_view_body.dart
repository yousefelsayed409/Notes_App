import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notsapp/views/widgets/App_Name.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  String getGreetings() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning  ";
    } else if (hour < 17) {
      return "Good Afternoon ";
    } else if (hour < 22) {
      return "Good Evening ";
    } else {
      return "Good Night ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const CustomAppBar(
              title: 'Az-Notes',
              icon: Icons.notes_rounded,
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: AppMorningTextWidget(textt: '${getGreetings()}❤️')
                  // MorningWidget(
                  //   getGreetings(),
                  // ),
                  ),
            ),
            const Expanded(
              child: NotesListView(),
            ),
          ],
        ),
      ),
    );
  }
}
