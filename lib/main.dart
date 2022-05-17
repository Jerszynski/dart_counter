import 'package:flutter/material.dart';

//________________counter 1

class Counter1 extends StatefulWidget {
  const Counter1({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter1> {
  int _counter1 = 0;

  void _increment() {
    setState(() {
      _counter1++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $_counter1'),
      ],
    );
  }
}

//________________counter 2

class Counter2 extends StatefulWidget {
  const Counter2({Key? key}) : super(key: key);

  @override
  _Counter2State createState() => _Counter2State();
}

class _Counter2State extends State<Counter2> {
  int _counter2 = 0;

  void _increment() {
    setState(() {
      _counter2++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter2 != 0) {
        _counter2--;
      } else {
        _counter2 = 0;
      }
    });
  }

  void _reset() {
    setState(() {
      _counter2 = 0;
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
        Text('Count: $_counter2'),
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
        body: Container(
          margin:
              const EdgeInsets.symmetric(vertical: 200.0, horizontal: 100.0),
          color: const Color.fromARGB(255, 244, 244, 244),
          width: 800,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Counter1(),
              Counter2(),
            ],
          ),
        ),
      ),
    ),
  );
}
