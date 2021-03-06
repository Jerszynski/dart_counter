import 'package:flutter/material.dart';

var player2Name = '';

class Player2TextField extends StatefulWidget {
  const Player2TextField(
    this.fieldTitle, {
    Key? key,
  }) : super(key: key);

  final String fieldTitle;

  @override
  State<Player2TextField> createState() => _Player2TextField();
}

class _Player2TextField extends State<Player2TextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.5), width: 2.0),
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
          player2Name = newValue;
        });
      },
    );
  }
}
