import 'package:dart_counter/main_view/main_view_content.dart';
import 'package:dart_counter/my_account/my_account_content.dart';
import 'package:dart_counter/scores/scores_page.dart';
import 'package:dart_counter/settings_content/settings_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const MainViewPageContent();
          }
          if (currentIndex == 1) {
            return const ScoresPageContent();
          }

          if (currentIndex == 2) {
            return const SettingsPageContent();
          }
          return MyAccountPageContent(email: widget.user.email);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        selectedItemColor: Colors.white.withOpacity(0.8),
        backgroundColor: Colors.blueGrey,
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
