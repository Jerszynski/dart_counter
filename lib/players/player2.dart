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
      if (player2Counter == 3) {
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

  final textStyle = const TextStyle(
    fontSize: 24,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
