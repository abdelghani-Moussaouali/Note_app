import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/cubit/notes_cubit.dart';
import 'package:note_app/views/Widget/Component/Custom_App_Bar.dart';

import 'package:note_app/views/Widget/Note_view/Notes_List_view.dart';

class NotsViewBody extends StatefulWidget {
  const NotsViewBody({
    super.key,
  });

  @override
  State<NotsViewBody> createState() => _NotsViewBodyState();
}

class _NotsViewBodyState extends State<NotsViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(title: 'Notes', icon: Icons.search, onTap: null,),
        Expanded(
          child: NotesListView(),
        ),
      ],
    );
  }
}
