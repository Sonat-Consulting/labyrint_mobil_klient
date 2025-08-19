import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:labyrint_mobil_klient/model/direction.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'model/game-action.dart';

import 'globals.dart' as globals;

class Game extends StatefulWidget {
  const Game({super.key, required this.id, required this.username});

  final String id;
  final String username;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late WebSocketChannel channel;

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
      clientId: globals.clientId,
      direction: direction,
    );
    print('Sending action: $action');
    channel.sink.add(jsonEncode(action));
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print('Initializing game...');
    print('ClientId: ${globals.clientId}');
    print('Username: ${widget.username}');
    print('GameId: ${widget.id}');

    var cId = globals.gameId == widget.id ? globals.clientId : '';
    globals.gameId = widget.id;

    channel = WebSocketChannel.connect(
      Uri.parse(
        'wss://mazeserverwebapp-apd7asc7aqcdasbv.norwayeast-01.azurewebsites.net/api/Maze/MazePlayer?username=${widget.username}&gameId=${widget.id}&id=$cId',
      ),
    );

    channel.stream.listen(
      (message) {
        print('Message Received: $message');
        final jsonMessage = jsonDecode(message);
        if (jsonMessage['Action'] == 'ClientRegistered') {
          globals.clientId = jsonMessage['ClientId'];
          print('ClientId: ${globals.clientId}');
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
