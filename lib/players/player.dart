import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  int playerCounter = 0;
  int gamesCounter = 0;

  void incrementButton() {
    setState(() {
      playerCounter++;
      if (playerCounter == 3) {
        gamesCounter++;
        playerCounter = 0;
      }
    });
  }

  void decrementButton() {
    setState(() {
      playerCounter != 0 ? playerCounter-- : playerCounter = 0;
    });
  }

  void resetButton() {
    setState(() {
      playerCounter = 0;
      gamesCounter = 0;
    });
  }

  final textStyle = const TextStyle(
    fontSize: 24,
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
            Button(onPressed: incrementButton, title: 'Increment'),
            Button(onPressed: decrementButton, title: 'Decrement'),
            Button(onPressed: resetButton, title: 'Reset'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Games: $gamesCounter',
              style: textStyle,
            ),
            Text(
              'Sets: $playerCounter',
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
