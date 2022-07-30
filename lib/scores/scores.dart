import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_counter/settings_content/settings_content.dart';
import 'package:flutter/material.dart';

class ScoresPageContent extends StatefulWidget {
  const ScoresPageContent({Key? key}) : super(key: key);

  @override
  State<ScoresPageContent> createState() => _ScoresPageContentState();
}

class _ScoresPageContentState extends State<ScoresPageContent> {
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
                    mainAxisSpacing: 2,
                  ),
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 25, right: 25),
                  children: <Widget>[
                    for (final document in documents) ...[
                      DateContainer(document['Date']),
                      ContainerForData(document['Player1']),
                      ContainerWithMargin(document['Score1'].toString()),
                      ContainerForData(document['Score2'].toString()),
                      ContainerWithMargin(document['Player2']),
                      DeleteButton(document: document)
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

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.document,
  }) : super(key: key);

  final QueryDocumentSnapshot<Object?> document;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: deleteStatus
            ? const Color.fromARGB(160, 238, 238, 238)
            : const Color.fromARGB(255, 255, 0, 0).withOpacity(0.6),
      ),
      child: TextButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('scores')
              .doc(document.id)
              .delete();
        },
        child: const Icon(
          Icons.highlight_remove_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}

class ContainerForData extends StatelessWidget {
  const ContainerForData(
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

class DateContainer extends StatelessWidget {
  const DateContainer(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(right: 4.0),
      color: dateStatus
          ? const Color.fromARGB(160, 238, 238, 238)
          : const Color.fromARGB(255, 85, 253, 82).withOpacity(0.6),
      child: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ContainerWithMargin extends StatelessWidget {
  const ContainerWithMargin(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(right: 4.0),
      color: const Color.fromARGB(160, 238, 238, 238),
      child: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
