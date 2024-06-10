import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Constantes.dart';
import 'package:note_app/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/Cubits/cubit/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/Widget/Component/Custom_App_Bar.dart';
import 'package:note_app/views/Widget/Component/Custom_textFormField.dart';
import 'package:note_app/views/Widget/Component/ColorsListView.dart';
import 'package:note_app/views/Widget/Component/Edit_Note_Colors_LIst.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Edit Note',
                icon: Icons.check,
                onTap: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = subtitle ?? widget.note.subtitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Center(child: Text('your note is updated '))));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomtextField(
                hint: widget.note.title,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomtextField(
                hint: widget.note.subtitle,
                maxLine: 6,
                onChanged: (value) {
                  subtitle = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              EditNoteColorsList(
                note: widget.note,
              )
            ],
          )),
    );
  }
}
