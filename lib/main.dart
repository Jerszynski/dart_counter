import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_counter/players/player.dart';
import 'package:dart_counter/scores/scores.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'Simple Dart Counter for 2 ppl.',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Counter'),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
        foregroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(40),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TextFields('Player 1', controller),
                const SizedBox(height: 10),
                const PlayerContainer(Player()),
                const SizedBox(height: 40),
                TextFields('Player 2', controller),
                const SizedBox(height: 10),
                const PlayerContainer(Player()),
                const SizedBox(height: 20),
                MyButton(
                  title: 'Save Scores',
                  onPressed: () {
                    FirebaseFirestore.instance.collection('scores').add(
                      {
                        'Player': controller.text,
                      },
                    );
                  },
                ),
                MyButton(
                  title: 'Scores',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Scores(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.green.shade600),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

class PlayerContainer extends StatelessWidget {
  const PlayerContainer(
    this.playerContainer, {
    Key? key,
  }) : super(key: key);

  final Widget playerContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 244, 244).withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      height: 180,
      child: playerContainer,
    );
  }
}

class TextFields extends StatelessWidget {
  const TextFields(
    this.fieldTitle,
    this.controller, {
    Key? key,
  }) : super(key: key);

  final String fieldTitle;
  final controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
        labelText: fieldTitle,
        labelStyle: const TextStyle(
          color: Colors.black45,
        ),
      ),
    );
  }
}
