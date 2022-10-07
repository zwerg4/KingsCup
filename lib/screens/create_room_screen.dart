import 'package:first_multiplayer_game/responsive/responsive.dart';
import 'package:first_multiplayer_game/widgets/custom_button.dart';
import 'package:first_multiplayer_game/widgets/custom_text.dart';
import 'package:first_multiplayer_game/widgets/custom_textfield.dart';
import 'package:first_multiplayer_game/resources/socket_methods.dart';
import 'package:flutter/material.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
    _socketMethods.updatePlayer(context);
  }

  @override
  void dispose() {
    super.dispose();
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
              blurRadius: 40)], text: 'Create Room', fontSize: 70),
              SizedBox(height: size.height*0.08,),
              CustomTextField(controller: _nameController, hintText: "Enter your nickname"),
              SizedBox(height: size.height*0.03,),
              CustomButton(onTab: () => _socketMethods.createRoom(_nameController.text), text: "Create")
            ],
          ),
        ),
      ),
    );
  }
}
