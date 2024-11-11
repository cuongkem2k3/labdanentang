import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Xylophone(),
      ),
    ),
  );
}

class Xylophone extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  void playSound(int noteNumber) async {
    await player.play(AssetSource('note$noteNumber.mp3'));
  }

  Expanded buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(noteNumber);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.red, noteNumber: 1),
          buildKey(color: Colors.orange, noteNumber: 2),
          buildKey(color: Colors.yellow, noteNumber: 3),
          buildKey(color: Colors.green, noteNumber: 4),
          buildKey(color: Colors.teal, noteNumber: 5),
          buildKey(color: Colors.blue, noteNumber: 6),
          buildKey(color: Colors.purple, noteNumber: 7),
        ],
      ),
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: const Center(
          child: Text('You have pushed the button this many times:'),
        ),
      ),
    );
  }
}