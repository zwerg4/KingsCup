import 'package:first_multiplayer_game/provider/room_data_provider.dart';
import 'package:first_multiplayer_game/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIDController;

  @override
  void initState() {
    super.initState();
    roomIDController = TextEditingController(
        text: Provider.of<RoomDataProvider>(context, listen: false)
            .roomData['_id']);
  }

  @override
  void dispose() {
    super.dispose();
    roomIDController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const Text('Waiting for Host to start the game!'),
        const SizedBox(
          height: 20,
        ),
        const Text('LOBBY ID, share it !'),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: roomIDController,
          hintText: '',
          isReadOnly: true,
        ),
      ],
    );
  }
}
