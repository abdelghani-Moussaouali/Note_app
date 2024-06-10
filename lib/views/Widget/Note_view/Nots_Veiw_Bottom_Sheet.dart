import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/Cubits/cubit/notes_cubit.dart';

import 'package:note_app/views/Widget/Note_view/Nots_Veiw_Bottom_Sheet_Form.dart';

class NotsVoiwBottomSheet extends StatelessWidget {
  const NotsVoiwBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSucess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            return Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: const SingleChildScrollView(
              child: AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
