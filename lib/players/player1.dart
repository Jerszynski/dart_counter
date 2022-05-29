import 'package:flutter/material.dart';

class Player1 extends StatefulWidget {
  const Player1({Key? key}) : super(key: key);

  @override
  _Player1State createState() => _Player1State();
}

class _Player1State extends State<Player1> {
  int player1Counter = 0;
  int games1Counter = 0;

  void _increment() {
    setState(() {
      player1Counter++;
      if (player1Counter == 3) {
        games1Counter++;
        player1Counter = 0;
      }
    });
  }

  void _decrement() {
    setState(() {
      player1Counter != 0 ? player1Counter-- : player1Counter = 0;
    });
  }

  void _reset() {
    setState(() {
      player1Counter = 0;
      games1Counter = 0;
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
      children: <Widget>[
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
