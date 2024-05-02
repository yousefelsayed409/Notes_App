import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notsapp/simple_bloc_observer.dart';
import 'package:notsapp/views/splash_view.dart';
import 'combonants/constants.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: kSecondPrimaryColor,
            brightness: Brightness.dark,
            fontFamily: "VarelaRound"),
        home: SplashScreen(),
      ),
    );
  }
}
