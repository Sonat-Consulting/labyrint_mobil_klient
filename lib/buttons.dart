import 'package:flutter/material.dart';
import 'package:labyrint_mobil_klient/model/direction.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.go, required this.shoot});

  final void Function(int steps, Direction direction) go;
  final void Function(Direction direction) shoot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Play with buttons')),
      body: Center(),
    );
  }
}
