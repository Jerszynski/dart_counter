import 'package:flutter/material.dart';

//________________counter 1

class Player1 extends StatefulWidget {
  const Player1({Key? key}) : super(key: key);

  @override
  _Player1State createState() => _Player1State();
}

class _Player1State extends State<Player1> {
  int _Player1Counter = 0;
  int _Games1Counter = 0;

  void _increment() {
    setState(() {
      _Player1Counter++;
      if (_Player1Counter == 6) {
        _Games1Counter++;
        _Player1Counter = 0;
      }
    });
  }

  void _decrement() {
    setState(() {
      _Player1Counter != 0 ? _Player1Counter-- : _Player1Counter = 0;
    });
  }

  void _reset() {
    setState(() {
      _Player1Counter = 0;
      _Games1Counter = 0;
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
            Row(
              children: [
                Text(
                  'Games: $_Games1Counter',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Text(
                  'Sets: $_Player1Counter',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: _increment,
                  child: const Text('Increment'),
                ),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: _decrement,
                  child: const Text('Decrement'),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shadowColor: MaterialStateProperty.all(Colors.black),
                elevation: MaterialStateProperty.all(10),
              ),
              onPressed: _reset,
              child: const Text('Reset'),
            ),
          ],
        ),
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
  int _Games2Counter = 0;

  void _increment() {
    setState(() {
      _Player2Counter++;
      if (_Player2Counter == 6) {
        _Games2Counter++;
        _Player2Counter = 0;
      }
    });
  }

  void _decrement() {
    setState(() {
      _Player2Counter != 0 ? _Player2Counter-- : _Player2Counter = 0;
    });
  }

  void _reset() {
    setState(() {
      _Player2Counter = 0;
      _Games2Counter = 0;
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
            Row(
              children: [
                Text(
                  'Games: $_Games2Counter',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Text(
                  'Sets: $_Player2Counter',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: _increment,
                  child: const Text('Increment'),
                ),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: _decrement,
                  child: const Text('Decrement'),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shadowColor: MaterialStateProperty.all(Colors.black),
                elevation: MaterialStateProperty.all(10),
              ),
              onPressed: _reset,
              child: const Text('Reset'),
            ),
          ],
        ),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Enter player name'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 244, 244),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                width: 300,
                height: 180,
                child: const Player1(),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(),
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter player name'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 244, 244),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                width: 300,
                height: 180,
                child: const Player2(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
