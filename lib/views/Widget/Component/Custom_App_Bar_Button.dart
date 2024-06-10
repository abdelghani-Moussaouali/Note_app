import 'package:flutter/material.dart';

class CustonButton extends StatelessWidget {
  const CustonButton({
    super.key,
    required this.icon, this.onTap,
  });

  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.17),
          ),
          child: Icon(icon)),
    );
  }
}

