import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 244, 244).withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          width: 2,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      height: 36,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black87,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
