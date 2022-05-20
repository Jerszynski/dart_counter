import 'package:dart_counter/players/player1.dart';
import 'package:dart_counter/players/player2.dart';
import 'package:flutter/material.dart';

//-------------------- APP

void main() {
  runApp(
    MaterialApp(
      title: 'Simple Dart Counter for 2 ppl.',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dart Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextField(
                  // autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(),
                    ),
                    fillColor: Colors.grey[150],
                    filled: true,
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Enter player name',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    labelText: 'Player 1',
                    labelStyle: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 244, 244),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                width: 300,
                height: 180,
                child: const Player1(),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(),
                    ),
                    fillColor: Colors.grey[150],
                    filled: true,
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Enter player name',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    labelText: 'Player 2',
                    labelStyle: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 244, 244),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                width: 300,
                height: 180,
                child: const Player2(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
