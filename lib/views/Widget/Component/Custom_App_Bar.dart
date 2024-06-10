import 'package:flutter/material.dart';
import 'package:note_app/views/Widget/Component/Custom_App_Bar_Button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon,required this.onTap});
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 20, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          CustonButton(icon: icon,onTap: onTap,),
    
        ],
      ),
    );
  }
}



