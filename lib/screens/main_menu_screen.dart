import 'package:first_multiplayer_game/screens/create_room_screen.dart';
import 'package:first_multiplayer_game/screens/join_room_screen.dart';
import 'package:first_multiplayer_game/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:first_multiplayer_game/responsive/responsive.dart';

class MainManuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainManuScreen ({Key? key}) : super(key: key);

  void createRoom(BuildContext context){
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context){
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(onTab: () => createRoom(context), text: 'Create Room'),
            const SizedBox(height:20),
            CustomButton(onTab: () => joinRoom(context), text: 'Join Room')
          ],
        ),
      ),
    );
  }
}



