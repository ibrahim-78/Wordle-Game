import 'package:flutter/material.dart';

import 'game_board.dart';
import 'game_provider.dart';

class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.game,{super.key});
  WordleGame game;

  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {
  List row1 = "QWERTYUIOP".split("");
  List row2= "ASDFGHJKL".split("");
  List row3 = ["DEL","Z","X","C","V","B","N","M","SUBMIT"];
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Text(WordleGame.game_message,style: TextStyle(
          color: Colors.red,
        )),
        SizedBox(height: 20.0,),
        GameBoard(widget.game),
        SizedBox(height: 40.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e){
            return InkWell(
              onTap: (){
                print(e);
                if(widget.game.letterId < 5){
                  setState(() {
                    widget.game.insertWord(widget.game.letterId, Letter(e,0));
                    widget.game.letterId++;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text("${e}",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map((e){
            return InkWell(
              onTap: (){
                print(e);
                if(widget.game.letterId < 5){
                  setState(() {
                    widget.game.insertWord(widget.game.letterId, Letter(e,0));
                    widget.game.letterId++;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text("${e}",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map((e){
            return InkWell(
              onTap: (){
                print(e);

                if(e == "DEL"){
                  if(widget.game.letterId > 0){
                    setState(() {
                      widget.game.insertWord(widget.game.letterId - 1,Letter("",0));
                      widget.game.letterId--;
                    });
                  }
                }else if(e=="SUBMIT"){
                  if(widget.game.letterId >=5){
                    setState(() {
                      String guess = widget.game.wordleBoard[widget.game.rowId].map((e) => e.letter).join();
                      if(widget.game.checkWordExist(guess)){
                        if(guess==WordleGame.game_guess){
                          setState(() {
                            WordleGame.game_message = "You Won, Congrats!!";
                            widget.game.wordleBoard[widget.game.rowId].forEach((element) {
                              element.code = 1;
                            });
                          });
                        }else{
                          int listLength = guess.length;
                          for(int i = 0; i<listLength;i++){
                            String char  = guess[i];
                            if(WordleGame.game_guess.contains(char)){
                              if(WordleGame.game_guess[i]==char){
                                setState(() {
                                  widget.game.wordleBoard[widget.game.rowId][i].code =1 ;
                                });
                              }
                              else{
                                setState(() {
                                  widget.game.wordleBoard[widget.game.rowId][i].code=2;
                                });
                              }
                            }
                          }
                          widget.game.rowId++;
                          widget.game.letterId =0;
                        }

                      }else
                      {

                        WordleGame.game_message = "Word not recognized";
                      }
                    });
                  }
                }else{
                  if(widget.game.letterId < 5){
                    setState(() {
                      widget.game.insertWord(widget.game.letterId, Letter(e,0));
                      widget.game.letterId++;
                    });
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text("${e}",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            );
          }).toList(),
        ),

      ],
    );
  }
}