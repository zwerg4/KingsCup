import 'package:socket_io_client/socket_io_client.dart' as IO;

//Singleton class of socket instance
class SocketClient {
  IO.Socket ? socket;
  static SocketClient? _instance;

  SocketClient._internal(){
  socket = IO.io("http://192.168.0.208:3000", <String, dynamic>{ //http://192.168.0.208:3000 //45.156.242.189
    'transports': ['websocket'],
    'autoConnect': false,
  });
  socket!.connect();
  }

  static SocketClient get instance{
  _instance ??= SocketClient._internal();
  return _instance!;
  }
}