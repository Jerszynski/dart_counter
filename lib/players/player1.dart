import 'package:flutter/material.dart';

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
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[600]),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(10),
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
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[600]),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(10),
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
