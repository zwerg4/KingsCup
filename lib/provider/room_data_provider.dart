import 'package:first_multiplayer_game/model/player.dart';
import 'package:flutter/material.dart';

class RoomDataProvider extends ChangeNotifier{
  Map<String, dynamic> _roomData = {};
  Player _player = Player('', '', false);

  Map<String, dynamic> get roomData => _roomData;

  Player get player => _player;

  void updateRoomData( Map<String, dynamic> data){
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer(String nickname, String socketID, bool isHost) {
    _player = Player(nickname, socketID, isHost);
    notifyListeners();
  }
}