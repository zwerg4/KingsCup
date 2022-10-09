import 'package:first_multiplayer_game/provider/room_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class turnDisplay extends StatelessWidget {
  const turnDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                roomDataProvider.roomData['turn']['nickname'] + '\'s turn',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
