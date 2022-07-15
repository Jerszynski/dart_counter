import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

bool dateStatus = false;
bool deleteStatus = false;

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 12.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, -2.0),
                      blurRadius: 12.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'SETTINGS',
                            style: TextStyle(
                              fontSize: 24,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SingleRowTitle(
                              title:
                                  'Date container color switch \non Score Page'),
                          FlutterSwitch(
                            width: 50.0,
                            height: 25.0,
                            padding: 6.0,
                            showOnOff: true,
                            valueFontSize: 12.0,
                            toggleSize: 12.0,
                            activeColor: Colors.green,
                            value: dateStatus,
                            onToggle: (value) {
                              setState(() {
                                dateStatus = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SingleRowTitle(
                              title:
                                  'Delete container color switch \non Score Page'),
                          FlutterSwitch(
                            width: 50.0,
                            height: 25.0,
                            padding: 6.0,
                            showOnOff: true,
                            valueFontSize: 12.0,
                            toggleSize: 12.0,
                            activeColor: Colors.green,
                            value: deleteStatus,
                            onToggle: (value) {
                              setState(() {
                                deleteStatus = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleRowTitle extends StatelessWidget {
  const SingleRowTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, textAlign: TextAlign.left);
  }
}
