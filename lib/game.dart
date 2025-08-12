import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:labyrint_mobil_klient/model/direction.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'model/game-action.dart';

class Game extends StatefulWidget {
  final WebSocketChannel channel;

  const Game({super.key, required this.id, required this.channel});

  final String id;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String clientId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Spill')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("GameId: ${widget.id}"),
            ElevatedButton(
              child: const Text('Knapper'),
              onPressed: () {
                print('Spill med knapper');
              },
            ),
            ElevatedButton(
              child: const Text('Gyro'),
              onPressed: () {
                print('Spill med knapper');
              },
            ),
            ElevatedButton(
              child: const Text('Kompass'),
              onPressed: () {
                print('Spill med Kompass');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _sendGameAction(String gameId, Direction direction) {
    var action = GameAction(
      action: "MovePlayer",
      gameId: gameId,
      clientId: clientId,
      direction: direction,
    );
    print('Sending action: $action');
    widget.channel.sink.add(jsonEncode(action));
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    widget.channel.stream.listen(
      (message) {
        print('Message Received: $message');
        final jsonMessage = jsonDecode(message);
        if (jsonMessage['Action'] == 'ClientRegistered') {
          clientId = jsonMessage['ClientId'];
          print('ClientId: $clientId');
        }
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        print('WebSocket closed');
      },
    );
  }
}
