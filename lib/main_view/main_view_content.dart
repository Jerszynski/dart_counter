import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_counter/main_buttons/main_button_content.dart';
import 'package:dart_counter/player_container/player_container_content.dart';
import 'package:dart_counter/players/player1.dart';
import 'package:dart_counter/players/player2.dart';
import 'package:dart_counter/scores/scores.dart';
import 'package:dart_counter/text_fields/text_field_content.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

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
                const TextFields('Player 1'),
                const SizedBox(height: 10),
                const PlayerContainer(Player1()),
                const SizedBox(height: 40),
                const TextFields('Player 2'),
                const SizedBox(height: 10),
                const PlayerContainer(Player2()),
                const SizedBox(height: 20),
                MainButton(
                  title: 'Save Scores',
                  onPressed: () {
                    FirebaseFirestore.instance.collection('scores').add(
                      {
                        'Player': 'Coś',
                      },
                    );
                  },
                ),
                MainButton(
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
