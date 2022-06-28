import 'package:flutter/material.dart';

class PlayerContainer extends StatelessWidget {
  const PlayerContainer(
    this.playerContainer, {
    Key? key,
  }) : super(key: key);

  final Widget playerContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 244, 244).withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      height: 180,
      child: playerContainer,
    );
  }
}
