import 'package:flutter/material.dart';
import 'package:note_app/Constantes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading = false,
  });
  final String title;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top:10 ),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child:!isLoading
              ? Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : const SizedBox(
                  height: 27,
                  width: 27,
                  child: CircularProgressIndicator(
                    color: kBlackColor,
                  ),
                ),
        ),
      ),
    );
  }
}
