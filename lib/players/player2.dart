import 'package:flutter/material.dart';

class Player2 extends StatefulWidget {
  const Player2({Key? key}) : super(key: key);

  @override
  _Player2State createState() => _Player2State();
}

class _Player2State extends State<Player2> {
  int player2Counter = 0;
  int games2Counter = 0;

  void _increment() {
    setState(() {
      player2Counter++;
      if (player2Counter == 3) {
        games2Counter++;
        player2Counter = 0;
      }
    });
  }

  void _decrement() {
    setState(() {
      player2Counter != 0 ? player2Counter-- : player2Counter = 0;
    });
  }

  void _reset() {
    setState(() {
      player2Counter = 0;
      games2Counter = 0;
    });
  }

  final buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(Colors.green.shade600),
    shadowColor: MaterialStateProperty.all(Colors.black),
    elevation: MaterialStateProperty.all(5),
  );

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
            ElevatedButton(
              style: buttonStyle,
              onPressed: _increment,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              style: buttonStyle,
              onPressed: _decrement,
              child: const Text('Decrement'),
            ),
            ElevatedButton(
              style: buttonStyle,
              onPressed: _reset,
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
