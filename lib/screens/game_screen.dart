import 'package:first_multiplayer_game/provider/room_data_provider.dart';
import 'package:first_multiplayer_game/screens/waiting_lobby.dart';
import 'package:first_multiplayer_game/screens/waiting_lobby_host.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/socket_methods.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';

  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.startGameListener(context);
  }


  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin'] ? roomDataProvider.player.isHost ? const WaitingLobbyHost() : const WaitingLobby() :
        Center(child: Text( Provider.of<RoomDataProvider>(context).roomData.toString(),),),
    );
  }
}
