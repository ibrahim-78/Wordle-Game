import 'package:flutter/material.dart';
import 'game_provider.dart';

class GameBoard extends StatefulWidget {
  GameBoard(this.game, {super.key});
  WordleGame game;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.wordleBoard.map((e) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: e.map((e) => Container(
          padding: EdgeInsets.all(16.0),
          width: 64.0,
          height: 64.0,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: e.code == 0
                ? Colors.red.shade800
                : e.code == 1
                ? Colors.green.shade400
                : Colors.amber.shade400,
          ),
          child: Center(
            child: Text(
              e.letter!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )).toList(),
      ))
          .toList(),
    );
  }
}
