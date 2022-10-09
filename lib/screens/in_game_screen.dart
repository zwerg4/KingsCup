import 'package:first_multiplayer_game/views/card.dart';
import 'package:first_multiplayer_game/views/turn_display.dart';
import 'package:flutter/material.dart';

class inGameScreen extends StatefulWidget {
  static String routeName = '/inGame';

  const inGameScreen({Key? key}) : super(key: key);

  @override
  State<inGameScreen> createState() => _inGameScreenState();
}

class _inGameScreenState extends State<inGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const turnDisplay(),
            Container(
              alignment: Alignment.center,
              child: const MyCard(),
            )
          ],
        ),
      ),
    );
  }
}
