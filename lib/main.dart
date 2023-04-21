import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_xo/Game_Xo.dart';
import 'package:game_xo/Player_Screen.dart';



void main() {
  runApp(MyApp());
}
/*
creat first class
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //takes key and value

        GameXo.routeName:(context)=>GameXo(),
        PlayerScreen.routeName:(context)=>PlayerScreen()
      },
      initialRoute: PlayerScreen.routeName,
    );
  }
}

