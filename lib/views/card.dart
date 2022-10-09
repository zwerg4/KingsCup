import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

import '../model/cards.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
      color: Colors.white,
        height: 300,
        width: 200,
        child: Image.asset('assets/images/Rueckseite.png'),
    )
    );*/
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        width: 280,
        height: 400,
        color: Colors.transparent,
        child: Image.asset('assets/images/Rueckseite.png'),
      ),
      back: Container(
        width: 280,
        height: 400,
        color: Colors.transparent,
        child: Image.asset('assets/images/' + Cards().getRandomCard()),
      ),
    );
  }
}
