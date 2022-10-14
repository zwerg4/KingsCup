import 'package:first_multiplayer_game/model/player.dart';
import 'package:flutter/material.dart';

import '../model/cards.dart';

class RoomDataProvider extends ChangeNotifier{
  Map<String, dynamic> _roomData = {};
  Player _player = Player('', '', false);
  Cards cards = Cards();

  Map<String, dynamic> get roomData => _roomData;

  Player get player => _player;

  void updateRoomData( Map<String, dynamic> data){
    _roomData = data;
    cards.nextCard = _roomData['nextCard'];
    cards.allCardsList = List<String>.from(_roomData['cards'] as List); //cast List<dynamic> to List <String>
    notifyListeners();
  }

  void updatePlayer(String nickname, String socketID, bool isHost) {
    _player = Player(nickname, socketID, isHost);
    notifyListeners();
  }
}