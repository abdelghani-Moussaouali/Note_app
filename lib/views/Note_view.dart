import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/cubit/notes_cubit.dart';
import 'package:note_app/views/Widget/Note_view/Notes_View_Body.dart';
import 'package:note_app/views/Widget/Note_view/Nots_Veiw_Bottom_Sheet.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const NotsVoiwBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
        body: const NotsViewBody());
  }
}
