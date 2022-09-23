import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_counter/main_buttons/main_button_content.dart';
import 'package:dart_counter/player_container/player_container_content.dart';
import 'package:dart_counter/players/player1_page.dart';
import 'package:dart_counter/players/player2_page.dart';
import 'package:dart_counter/text_fields/player_one_text_field_content.dart';
import 'package:dart_counter/text_fields/player_two_text_field_content.dart';
import 'package:flutter/material.dart';

class MainViewPageContent extends StatefulWidget {
  const MainViewPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<MainViewPageContent> createState() => _MainViewPageContentState();
}

class _MainViewPageContentState extends State<MainViewPageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Counter'),
        centerTitle: true,
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
                const SizedBox(height: 4),
                const PlayerContainer(Player1()),
                const SizedBox(height: 10),
                const Player2TextField('Player 2'),
                const SizedBox(height: 4),
                const PlayerContainer(Player2()),
                const SizedBox(height: 4),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
