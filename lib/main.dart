import 'package:dart_counter/players/player1.dart';
import 'package:dart_counter/players/player2.dart';
import 'package:flutter/material.dart';

//-------------------- APP

void main() {
  runApp(const DartMain());
}

class DartMain extends StatelessWidget {
  const DartMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstPlayerTextField = TextField(
      // autofocus: true,
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
        labelText: 'Player 1',
        labelStyle: const TextStyle(
          color: Colors.black45,
        ),
      ),
    );

    final firstPlayerContainer = Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 244, 244).withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      height: 180,
      child: const Player1(),
    );

    final secondPlayerTextField = TextField(
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
        labelText: 'Player 2',
        labelStyle: const TextStyle(
          color: Colors.black45,
        ),
      ),
    );

    final secondPLayerContainer = Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 244, 244).withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      height: 180,
      child: const Player2(),
    );

    final buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.green.shade600),
    );

    var scoreContainer = ElevatedButton(
      style: buttonStyle,
      onPressed: () {},
      child: const Text('Scores'),
    );

    return MaterialApp(
      title: 'Simple Dart Counter for 2 ppl.',
      home: Scaffold(
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
                padding: const EdgeInsets.all(60),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  firstPlayerTextField,
                  const SizedBox(height: 10),
                  firstPlayerContainer,
                  const SizedBox(height: 40),
                  secondPlayerTextField,
                  const SizedBox(height: 10),
                  secondPLayerContainer,
                  const SizedBox(height: 40),
                  scoreContainer,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
