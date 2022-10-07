import 'package:first_multiplayer_game/provider/room_data_provider.dart';
import 'package:first_multiplayer_game/widgets/custom_button.dart';
import 'package:first_multiplayer_game/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaitingLobbyHost extends StatefulWidget {
  const WaitingLobbyHost({Key? key}) : super(key: key);

  @override
  State<WaitingLobbyHost> createState() => _WaitingLobbyHostState();
}

class _WaitingLobbyHostState extends State<WaitingLobbyHost> {
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
        const Text(
          'You are the HOST, start when all players are Ready',
          style: TextStyle(fontSize: 25),
        ),
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
        const SizedBox(
          height: 20,
        ),
        CustomButton(onTab: () => {}, text: 'start the game'),
      ],
    );
  }
}
