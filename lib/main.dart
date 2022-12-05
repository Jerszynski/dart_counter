import 'package:dart_counter/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Dart Counter',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const RootPage(),
    ),
  );
}
