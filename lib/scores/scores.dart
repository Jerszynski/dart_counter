import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Scores extends StatefulWidget {
  const Scores({Key? key}) : super(key: key);

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scores'),
        backgroundColor: const Color.fromRGBO(67, 160, 71, 0.8),
        foregroundColor: Colors.black87,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade400,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.keyboard_backspace_rounded),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromRGBO(67, 160, 71, 0.8),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/scores-background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('scores').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Wystąpił nieoczekiwany problem');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text(
                    'Prosze czekać, trwa ładowanie danych',
                    style: TextStyle(color: Colors.white),
                  );
                }

                final documents = snapshot.data!.docs;

                return GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 2,
                    mainAxisSpacing: 6,
                  ),
                  padding: const EdgeInsets.all(24),
                  children: <Widget>[
                    for (final document in documents) ...[
                      ScoreWidget(document['Player1']),
                      ScoreWidget(document['Score1'].toString()),
                      ScoreWidget(document['Player2']),
                      ScoreWidget(document['Score2'].toString()),
                    ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreWidget extends StatelessWidget {
  const ScoreWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      color: const Color.fromARGB(160, 238, 238, 238),
      child: Text(title),
    );
  }
}
