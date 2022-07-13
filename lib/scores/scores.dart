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
              stream: FirebaseFirestore.instance
                  .collection('scores')
                  .orderBy('Date', descending: true)
                  .snapshots(),
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
                    crossAxisCount: 6,
                    childAspectRatio: 1.6,
                    mainAxisSpacing: 6,
                  ),
                  padding: const EdgeInsets.all(15),
                  children: <Widget>[
                    for (final document in documents) ...[
                      ScoreWidget(document['Date']),
                      ScoreWidget(document['Player1']),
                      ScoreWidget(document['Score1'].toString()),
                      ScoreWidget(document['Score2'].toString()),
                      ScoreWidget(document['Player2']),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(159, 255, 0, 0),
                          ),
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('scores')
                              .doc(document.id)
                              .delete();
                        },
                        child: const Icon(
                          Icons.remove_sharp,
                          color: Colors.black,
                        ),
                      )
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
      child: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
