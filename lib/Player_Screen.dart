import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_xo/Game_Xo.dart';

class PlayerScreen extends StatelessWidget{
  static const String routeName='Player_Screen';
String Player1Name ="";
String Player2Name= "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player1"),
        centerTitle: true,

      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: [
            TextField(
              onChanged: (Text){

                Player1Name =Text;
              },
              decoration: InputDecoration(
                labelText: 'player1 Name'

              ),

            ),
            TextField(
              onChanged: (Text){
                Player2Name= Text;
              },
              decoration: InputDecoration(
                  labelText: 'player1 Name'

              ),

            ),
            ElevatedButton(onPressed:(){
              Navigator.of(context).pushNamed(GameXo.routeName,
              arguments: GameBoradArguments(Player1Name: Player1Name,
                                            Player2Name: Player2Name));

            }, child: Text('Lets start the game'))

          ],

        ),
      ),

    );

  }




}