import 'package:first_multiplayer_game/provider/room_data_provider.dart';
import 'package:first_multiplayer_game/screens/create_room_screen.dart';
import 'package:first_multiplayer_game/screens/game_screen.dart';
import 'package:first_multiplayer_game/screens/in_game_screen.dart';
import 'package:first_multiplayer_game/screens/join_room_screen.dart';
import 'package:first_multiplayer_game/screens/main_menu_screen.dart';
import 'package:first_multiplayer_game/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Multiplayer Beta',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes:{ MainManuScreen.routeName: (context) => const MainManuScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScreen.routeName : (context) => const GameScreen(),
          inGameScreen.routeName : (context) => const inGameScreen(),
        },
        initialRoute:MainManuScreen.routeName, // MainManuScreen.routeName,
      ),
    );
  }
}