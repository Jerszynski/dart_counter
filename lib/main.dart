import 'package:dart_counter/players/player1.dart';
import 'package:dart_counter/players/player2.dart';
import 'package:dart_counter/scores/scores.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Simple Dart Counter for 2 ppl.',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.green.shade600),
    );

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
                image: AssetImage("images/tlo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(40),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const TextFields('Player 1'),
                const SizedBox(height: 10),
                const PlayerContainer(Player1()),
                const SizedBox(height: 40),
                const TextFields('Player 2'),
                const SizedBox(height: 10),
                const PlayerContainer(Player2()),
                const SizedBox(height: 20),
                ScoreContainer(buttonStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreContainer extends StatelessWidget {
  const ScoreContainer(
    this.buttonStyle, {
    Key? key,
  }) : super(key: key);

  final ButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scores(),
          ),
        );
      },
      child: const Text('Scores'),
    );
  }
}

class PlayerContainer extends StatelessWidget {
  const PlayerContainer(
    this.playerContainer, {
    Key? key,
  }) : super(key: key);

  final dynamic playerContainer;

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
    this.fieldTitle, {
    Key? key,
  }) : super(key: key);

  final String fieldTitle;

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
        labelText: fieldTitle,
        labelStyle: const TextStyle(
          color: Colors.black45,
        ),
      ),
    );
  }
}
