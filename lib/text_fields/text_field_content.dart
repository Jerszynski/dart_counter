import 'package:flutter/material.dart';

var playerName = '';

class TextFields extends StatefulWidget {
  const TextFields(
    this.fieldTitle, {
    Key? key,
  }) : super(key: key);

  final String fieldTitle;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        fillColor: Colors.white.withOpacity(0.7),
        filled: true,
        prefixIcon: const Icon(Icons.person),
        hintText: 'Enter player name',
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        labelText: widget.fieldTitle,
        labelStyle: const TextStyle(
          color: Colors.black45,
        ),
      ),
      onChanged: (newValue) {
        setState(() {
          playerName = newValue;
        });
      },
    );
  }
}
