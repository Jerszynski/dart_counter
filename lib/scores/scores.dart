import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Scores extends StatelessWidget {
  const Scores({Key? key}) : super(key: key);

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
        color: const Color.fromRGBO(67, 160, 71, 0.8),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

                return ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    for (final document in documents) ...[
                      Dismissible(
                        key: ValueKey(document.id),
                        onDismissed: (_) {
                          FirebaseFirestore.instance
                              .collection('scores')
                              .doc(document.id)
                              .delete();
                        },
                        child: ScoreWidget(
                          document['Player 1'],
                        ),
                      ),
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
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      color: Color.fromARGB(160, 238, 238, 238),
      child: Text(title),
    );
  }
}
