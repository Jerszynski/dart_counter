import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_counter/main_buttons/main_button_content.dart';
import 'package:dart_counter/player_container/player_container_content.dart';
import 'package:dart_counter/players/player1.dart';
import 'package:dart_counter/players/player2.dart';
import 'package:dart_counter/scores/scores.dart';
import 'package:dart_counter/text_fields/player_one_text_field_content.dart';
import 'package:dart_counter/text_fields/player_two_text_field_content.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

// DateTime now = DateTime.now();
// String formattedDate = DateFormat('dd-mm-yy  kk:mm').format(now);

class _MainViewState extends State<MainView> {
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
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const Player1TextField('Player 1'),
                const SizedBox(height: 10),
                const PlayerContainer(Player1()),
                const SizedBox(height: 40),
                const Player2TextField('Player 2'),
                const SizedBox(height: 10),
                const PlayerContainer(Player2()),
                const SizedBox(height: 20),
                MainButton(
                  title: 'Save Scores',
                  onPressed: () {
                    FirebaseFirestore.instance.collection('scores').add(
                      {
                        'Date': DateTime.now().toString().substring(2, 10),
                        'Player1': player1Name,
                        'Score1': games1Counter,
                        'Player2': player2Name,
                        'Score2': games2Counter,
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
