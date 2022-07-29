import 'package:dart_counter/main_view/main_view_content.dart';
import 'package:dart_counter/scores/scores.dart';
import 'package:dart_counter/settings_content/settings_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
    required this.email,
  }) : super(key: key);

  final User user;
  final String? email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  late final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const MainView();
          }
          if (currentIndex == 1) {
            return const Scores();
          }

          if (currentIndex == 2) {
            return const SettingsPage();
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Jesteś zalogowany jako $email'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text('Wyloguj'),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Main Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scoreboard_outlined),
            label: 'Scores Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}
