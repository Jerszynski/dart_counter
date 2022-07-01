import 'package:flutter/material.dart';

int player2Counter = 0;
int games2Counter = 0;

class Player2 extends StatefulWidget {
  const Player2({Key? key}) : super(key: key);

  @override
  Player2State createState() => Player2State();
}

class Player2State extends State<Player2> {
  void incrementButton() {
    setState(() {
      player2Counter++;
      if (player2Counter == 6) {
        games2Counter++;
        player2Counter = 0;
      }
    });
  }

  void decrementButton() {
    setState(() {
      player2Counter != 0 ? player2Counter-- : player2Counter = 0;
    });
  }

  void resetButton() {
    setState(() {
      player2Counter = 0;
      games2Counter = 0;
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
              'Games: $games2Counter',
              style: textStyle,
            ),
            Text(
              'Sets: $player2Counter',
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
