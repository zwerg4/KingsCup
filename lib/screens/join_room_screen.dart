import 'package:first_multiplayer_game/resources/socket_methods.dart';
import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayer(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameIDController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(shadows: [Shadow(color: Colors.blue,
                  blurRadius: 40)], text: 'Join Room', fontSize: 70),
              SizedBox(height: size.height*0.08,),
              CustomTextField(controller: _nameController, hintText: "Enter your nickname"),
              SizedBox(height: size.height*0.03,),
              CustomTextField(controller: _gameIDController, hintText: "Enter your Room ID"),
              SizedBox(height: size.height*0.03,),
              CustomButton(onTab: () => _socketMethods.joinRoom(_nameController.text, _gameIDController.text), text: "Join")
            ],
          ),
        ),
      ),
    );
  }
}
