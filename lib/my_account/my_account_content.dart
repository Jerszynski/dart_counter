import 'package:dart_counter/app/cubit/root_cubit.dart';
import 'package:dart_counter/settings_content/settings_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
      ),
      backgroundColor: darkMode ? Colors.grey.shade800 : Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: darkMode ? Colors.grey.shade800 : Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: darkMode ? Colors.black : Colors.grey.shade600,
                      offset: const Offset(0.0, 2.0),
                      blurRadius: 12.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: darkMode ? Colors.grey.shade600 : Colors.white,
                      offset: const Offset(0.0, -2.0),
                      blurRadius: 12.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You are logged in as $email',
                        style: TextStyle(
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<RootCubit>().signOut();
                        },
                        child: Text(
                          'Wyloguj',
                          style: TextStyle(
                            color: darkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
