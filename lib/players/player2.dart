import 'package:flutter/material.dart';

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
