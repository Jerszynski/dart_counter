import 'package:dart_counter/app/home/home_page.dart';
import 'package:dart_counter/app/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      title: 'Simple Dart Counter for 2 ppl.',
      home: RootPage(),
    ),
  );
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
    this.email,
  }) : super(key: key);

  final String? email;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        final user = snapshot.data;
        if (user == null) {
          return LoginPage();
        }
        return HomePage(
          user: user,
          email: email,
        );
      }),
    );
  }
}
