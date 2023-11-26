import 'package:flutter/material.dart';
import 'package:project_1/game_provider.dart';

import 'game_keyboard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  WordleGame _game = WordleGame();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WordleGame.initGame();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Wordle",
            style:TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,

          ),
          GameKeyboard(_game),
        ],
      ),
    );
  }
}

