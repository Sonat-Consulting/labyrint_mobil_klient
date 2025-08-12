import 'package:flutter/material.dart';
import 'package:labyrint_mobil_klient/game.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenFormState();

  const HomeScreen({super.key});
}

class _HomeScreenFormState extends State<HomeScreen> {
  final gameIdController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  void dispose() {
    gameIdController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Start spill')),
      body: Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            TextField(
              controller: gameIdController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'id',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Brukernavn',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            ElevatedButton(
              child: const Text('Start spill'),
              onPressed: () {
                final channel = WebSocketChannel.connect(
                  Uri.parse(
                    'wss://mazeserverwebapp-apd7asc7aqcdasbv.norwayeast-01.azurewebsites.net/api/Maze/MazePlayer?username=${usernameController.text}&gameId=${gameIdController.text}',
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            Game(id: gameIdController.text, channel: channel),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
