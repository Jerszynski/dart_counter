import 'package:flutter/material.dart';

int player1Counter = 0;
int games1Counter = 0;

class Player1 extends StatefulWidget {
  const Player1({Key? key}) : super(key: key);

  @override
  Player1State createState() => Player1State();
}

class Player1State extends State<Player1> {
  // int player1Counter = 0;
  // int games1Counter = 0;

  void incrementButton() {
    setState(() {
      player1Counter++;
      if (player1Counter == 3) {
        games1Counter++;
        player1Counter = 0;
      }
    });
  }

  void decrementButton() {
    setState(() {
      player1Counter != 0 ? player1Counter-- : player1Counter = 0;
    });
  }

  void resetButton() {
    setState(() {
      player1Counter = 0;
      games1Counter = 0;
    });
  }

  final textButtonStyle = TextButton.styleFrom(
    primary: Colors.black,
    textStyle: const TextStyle(fontSize: 16),
  );

  final textStyle = const TextStyle(
    fontSize: 20,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: textButtonStyle,
              onPressed: incrementButton,
              child: const Text('Increment'),
            ),
            TextButton(
              style: textButtonStyle,
              onPressed: decrementButton,
              child: const Text('Decrement'),
            ),
            TextButton(
              style: textButtonStyle,
              onPressed: resetButton,
              child: const Text('Reset'),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Games: $games1Counter',
              style: textStyle,
            ),
            Text(
              'Sets: $player1Counter',
              style: textStyle,
            ),
          ],
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({
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
        shadowColor: MaterialStateProperty.all(Colors.black),
        elevation: MaterialStateProperty.all(5),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
