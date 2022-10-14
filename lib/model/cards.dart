import 'dart:core';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class Cards {
  List<String> allCardsList = [
    'a_1.png',
    'a_2.png',
    'a_3.png',
    'a_4.png',
    'a_5.png',
    'a_6.png',
    'a_7.png',
    'a_8.png',
    'a_9.png',
    'a_10.png',
    'a_11.png',
    'a_12.png',
    'a_13.png',
    'b_1.png',
    'b_2.png',
    'b_3.png',
    'b_4.png',
    'b_5.png',
    'b_6.png',
    'b_7.png',
    'b_8.png',
    'b_9.png',
    'b_10.png',
    'b_11.png',
    'b_12.png',
    'b_13.png',
    'c_1.png',
    'c_2.png',
    'c_3.png',
    'c_4.png',
    'c_5.png',
    'c_6.png',
    'c_7.png',
    'c_8.png',
    'c_9.png',
    'c_10.png',
    'c_11.png',
    'c_12.png',
    'c_13.png',
    'd_1.png',
    'd_2.png',
    'd_3.png',
    'd_4.png',
    'd_5.png',
    'd_6.png',
    'd_7.png',
    'd_8.png',
    'd_9.png',
    'd_10.png',
    'd_11.png',
    'd_12.png',
    'd_13.png',
  ];
  String nextCard = '';
 // final _random = Random();

  Cards(){
    nextCard = getRandomCard();
  }

  String getRandomCard(){
    final _random = Random();
    int cardIndex = _random.nextInt(allCardsList.length);
    String card = allCardsList[cardIndex];
    allCardsList.removeAt(cardIndex);
    return card;
  }
}
