import 'package:flutter/material.dart';

import 'package:note_app/Constantes.dart';

import 'package:note_app/model/note_model.dart';

import 'package:note_app/views/Widget/Component/ColorsListView.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColors[index].value;

                setState(() {});
              },
              child: ColorsItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            );
          }),
    );
  }
}
