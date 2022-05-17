import 'package:flutter/material.dart';

//________________counter 1

class Player1 extends StatefulWidget {
  const Player1({Key? key}) : super(key: key);

  @override
  _Player1State createState() => _Player1State();
}

class _Player1State extends State<Player1> {
  int _Player1Counter = 0;

  void _increment() {
    setState(() {
      _Player1Counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_Player1Counter != 0) {
        _Player1Counter--;
      } else {
        _Player1Counter = 0;
      }
    });
  }

  void _reset() {
    setState(() {
      _Player1Counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                onPressed: _increment,
                child: const Text('Increment'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                onPressed: _decrement,
                child: const Text('Decrement'),
              ),
            ),
            ElevatedButton(
              onPressed: _reset,
              child: const Text('Reset'),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Text('Count: $_Player1Counter'),
      ],
    );
  }
}

//________________counter 2

class Player2 extends StatefulWidget {
  const Player2({Key? key}) : super(key: key);

  @override
  _Player2State createState() => _Player2State();
}

class _Player2State extends State<Player2> {
  int _Player2Counter = 0;

  void _increment() {
    setState(() {
      _Player2Counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_Player2Counter != 0) {
        _Player2Counter--;
      } else {
        _Player2Counter = 0;
      }
    });
  }

  void _reset() {
    setState(() {
      _Player2Counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                onPressed: _increment,
                child: const Text('Increment'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                onPressed: _decrement,
                child: const Text('Decrement'),
              ),
            ),
            ElevatedButton(
              onPressed: _reset,
              child: const Text('Reset'),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Text('Count: $_Player2Counter'),
      ],
    );
  }
}

//-------------------- APP

void main() {
  runApp(
    MaterialApp(
      title: 'Simple Dart Counter for 2 ppl.',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dart Counter'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // margin: const EdgeInsets.symmetric(
              //     vertical: 200.0, horizontal: 100.0),
              color: const Color.fromARGB(255, 244, 244, 244),
              width: 300,
              height: 150,
              child: const Player1(),
            ),
            Container(
              // margin: const EdgeInsets.symmetric(
              //     vertical: 200.0, horizontal: 100.0),
              color: const Color.fromARGB(255, 244, 244, 244),
              width: 300,
              height: 150,
              child: const Player2(),
            ),
          ],
        ),

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: const [
        //     Counter1(),
        //     Player2(),
        //   ],
        // ),
      ),
    ),
  );
}
