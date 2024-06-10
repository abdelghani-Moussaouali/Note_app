import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Constantes.dart';
import 'package:note_app/Cubits/add_note_cubit/add_note_cubit.dart';

import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/Widget/Component/ColorsListView.dart';
import 'package:note_app/views/Widget/Component/Custom_Button.dart';
import 'package:note_app/views/Widget/Component/Custom_textFormField.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            CustomtextField(
              hint: 'title',
              onSaved: (data) {
                title = data;
              },
              onChanged: null,
            ),
            CustomtextField(
              hint: 'content',
              maxLine: 6,
              onSaved: (data) {
                subtitle = data;
              },
              onChanged: null,
            ),
            const SizedBox(
              height: 16,
            ),
            const ColorsListView(),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  title: 'Add',
                  onTap: () async {
                    var formateDate = DateTime.now();
                    var currentFormatrDate =
                        DateFormat('dd-MM-yyyy').format(formateDate);
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      NoteModel noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        color: Colors.orangeAccent.value,
                        date: currentFormatrDate,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
          
                       ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Center(child: Text('your note is added '))));
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
