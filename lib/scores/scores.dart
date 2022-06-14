import 'package:flutter/material.dart';

class Scores extends StatelessWidget {
  const Scores({Key? key}) : super(key: key);

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
        title: const Text('Scores'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.keyboard_backspace_rounded),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            color: Colors.grey,
            child: const Text('Here will be scores!'),
          ),
        ],
      ),
    );
  }
}
