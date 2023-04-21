import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:game_xo/board_btn.dart';

class GameXo extends StatefulWidget {
  static const String routeName = 'Game_Xo';

  @override
  State<GameXo> createState() => _GameXoState();
}

class _GameXoState extends State<GameXo> {
  List<String>boardstate =
  [
    '', '', '',
    '', '', '',
    '', '', '',

  ];
  int player1 = 0;
  int player2 = 0;

  @override
  Widget build(BuildContext context) {

var arg =ModalRoute.of(context)?.settings.arguments as GameBoradArguments;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Xo Game ",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('${arg.Player1Name}',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),),
                    Text('$player1',style: TextStyle(fontSize: 25),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('${arg.Player2Name}',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),),

                    Text('$player2',style: TextStyle(fontSize: 25),)
                  ],
                )
              ],
            ),
          ),


          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [


                BoardButton(text: boardstate[0],
                    index: 0,
                    onButtonClick: onButtonClicked),
                BoardButton(text: boardstate[1],
                    index: 1,
                    onButtonClick: onButtonClicked),
                BoardButton(text: boardstate[2],
                    index: 2,
                    onButtonClick: onButtonClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(text: boardstate[3],
                  index: 3,
                  onButtonClick: onButtonClicked,),
                BoardButton(text: boardstate[4],
                  index: 4,
                  onButtonClick: onButtonClicked,),
                BoardButton(text: boardstate[5],
                  index: 5,
                  onButtonClick: onButtonClicked,),

              ],

            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(text: boardstate[6],
                  index: 6,
                  onButtonClick: onButtonClicked,),
                BoardButton(text: boardstate[7],
                  index: 7,
                  onButtonClick: onButtonClicked,),
                BoardButton(text: boardstate[8],
                  index: 8,
                  onButtonClick: onButtonClicked,),

              ],

            ),
          ),


        ],
      ),
    );
  }

  int counter = 0;
  void onButtonClicked(int index) {
    if (boardstate[index].isNotEmpty) {
      return;
    }

    if (counter % 2 == 0) {
      boardstate[index] = 'X';
    } else {
      boardstate[index] = 'O';
    }
    counter++;
    if (checkWinner('X')) {
      player1 += 5;
      clearBorad();
    } else if (checkWinner('O')) {
      player2 += 5;
      clearBorad();
    }
    else if(counter==9){
      clearBorad();
    }
    setState(() {

    });
  }



  bool checkWinner(String symbol) {
  for (int i = 0; i < 9; i += 3) {
  if (boardstate[i] == symbol &&
  boardstate[i + 1] == symbol &&
  boardstate[i + 2] == symbol) {
  return true;
  }
  }
  for (int i = 0; i < 3; i++) {
  if (boardstate[i] == symbol &&
  boardstate[i + 3] == symbol &&
  boardstate[i + 6] == symbol) {
  return true;
  }
  }

  if (boardstate[0] == symbol &&
  boardstate[4] == symbol &&
  boardstate[5] == symbol) {
  return true;
  }

  if (boardstate[2] == symbol &&
  boardstate[4] == symbol &&
  boardstate[6] == symbol) {
  return true;
  }
  return false;


  }

  void clearBorad(){
    [
      '', '', '',
      '', '', '',
      '', '', '',

    ];
    counter=0;
    setState(() {

    });
  }
  }
// dataclass
  class GameBoradArguments{
  String Player1Name;
  String Player2Name;
  GameBoradArguments({required this.Player1Name, required this.Player2Name});

  }

