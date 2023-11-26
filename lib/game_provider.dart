import 'dart:math';

class WordleGame{
  int rowId=0;
  int letterId =0 ;
  static   String game_message = "";
  static   String game_guess = "";
  static   List<String> word_list = ["WORLD","FIGHT","BRAIN","PLANT","EARTH","ROBOT"];
  static bool gameOver =false;

  static List<Letter> wordleRow = List.generate(5, (index) => Letter("",0));


  List<List<Letter>> wordleBoard =List.generate(5, (index) => List.generate(5,((index) => Letter("",0))));


  static void initGame(){
    final random = new Random();
    int index  = random .nextInt(word_list.length);
    game_guess  = word_list[index];

  }

  void insertWord(index,word){
    wordleBoard[rowId][index]= word;

  }
  bool checkWordExist(String word){
    return word_list.contains(word);
  }

}


class Letter{
  String? letter;
  int code=0;
  Letter(this.letter,this.code);
}