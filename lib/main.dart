import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/Constantes.dart';
import 'package:note_app/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/Cubits/cubit/notes_cubit.dart';
import 'package:note_app/Simple_block_observer.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/Note_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlockObserver();
  Hive.registerAdapter(NoteModelAdapter()); // note model adapter generated
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
        BlocProvider<NotesCubit>(
          create: (context) => NotesCubit(),
        ),
        BlocProvider<AddNoteCubit>(
          create: (context) => AddNoteCubit(),
        ),
      //  create: (context) => AddNoteCubit(),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NoteView(),
      ),
    );
  }
}
