import 'dart:developer';

import 'package:first_multiplayer_game/provider/room_data_provider.dart';
import 'package:first_multiplayer_game/screens/game_screen.dart';
import 'package:first_multiplayer_game/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  //EMIT
  void createRoom(String _nickname) {
    log("CreateROOM from " + _nickname);
    if (_nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': _nickname,
      });
    }
  }

  void joinRoom(String _nickname, String roomID) {
    log(_nickname + " joins room: " + roomID);
    if (_nickname.isNotEmpty && roomID.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'nickname': _nickname,
        'roomID': roomID,
      });
    }
  }

  // LISTENER
  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccuredListener(BuildContext context) {
    _socketClient.on('errorOccured', (data) {
      showSnackBar(context, data);
    });
  }

  void updatePlayer(BuildContext context){
    _socketClient.on('updatePlayer', (playerData){
      Provider.of<RoomDataProvider>(context,listen: false).updatePlayer(playerData[0]['nickname'], playerData[0]['socketID'], playerData[1]);
    });
  }
}
