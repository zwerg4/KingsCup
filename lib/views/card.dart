import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';

import '../model/cards.dart';
import '../provider/room_data_provider.dart';
import '../resources/socket_methods.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    final SocketMethods _socketMethods = SocketMethods();
    final TextEditingController _nameController = TextEditingController();

    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      flipOnTouch: roomDataProvider.roomData['roundReady'] && (roomDataProvider.roomData['turn']['socketID'] == roomDataProvider.player.socketID),
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
        child: Image.asset('assets/images/' + roomDataProvider.roomData['nextCard']),
      ),
      onFlip: () => _socketMethods.cardFlipped(_nameController.text, roomDataProvider.cards.nextCard, roomDataProvider.cards.allCardsList),
    );
  }
}
