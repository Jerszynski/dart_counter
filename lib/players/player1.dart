import 'package:flutter/material.dart';

class Player1 extends StatefulWidget {
  const Player1({Key? key}) : super(key: key);

  @override
  Player1State createState() => Player1State();
}

class Player1State extends State<Player1> {
  int player1Counter = 0;
  int games1Counter = 0;

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
