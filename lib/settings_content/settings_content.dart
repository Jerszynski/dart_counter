import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

bool dateStatus = false;
bool deleteStatus = false;
bool darkMode = false;

class SettingsPageContent extends StatefulWidget {
  const SettingsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPageContent> createState() => _SettingsPageContentState();
}

class _SettingsPageContentState extends State<SettingsPageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SETTINGS',
                            style: TextStyle(
                              fontSize: 24,
                              decoration: TextDecoration.underline,
                              color: darkMode ? Colors.white : Colors.black87,
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
                          Text(
                            'Date container color switch \non Score Page',
                            style: TextStyle(
                              fontSize: 16,
                              color: darkMode ? Colors.white : Colors.black87,
                            ),
                          ),
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
                          Text(
                            'Delete container color switch \non Score Page',
                            style: TextStyle(
                              fontSize: 16,
                              color: darkMode ? Colors.white : Colors.black87,
                            ),
                          ),
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
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Settings dark mode',
                            style: TextStyle(
                              fontSize: 16,
                              color: darkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                          FlutterSwitch(
                            width: 50.0,
                            height: 25.0,
                            padding: 6.0,
                            showOnOff: true,
                            valueFontSize: 12.0,
                            toggleSize: 12.0,
                            activeColor: Colors.green,
                            value: darkMode,
                            onToggle: (value) {
                              setState(() {
                                darkMode = value;
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
