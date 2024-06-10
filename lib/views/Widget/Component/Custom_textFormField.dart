import 'package:flutter/material.dart';
import 'package:note_app/Constantes.dart';

class CustomtextField extends StatelessWidget {
  const CustomtextField({
    super.key,
    required this.hint,
    this.maxLine = 1,
    this.onSaved,
    required this.onChanged,
  });
  final String hint;
  final int maxLine;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onChanged: onChanged,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'field is required';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        maxLines: maxLine,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hint,
          border: textFieldMethoed(),
          enabledBorder: textFieldMethoed(),
          focusedBorder: textFieldMethoed(kPrimaryColor),
        ),
      ),
    );
  }

  OutlineInputBorder textFieldMethoed([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
