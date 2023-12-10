import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/tools/hiveRep.dart';

import '../tools/images.dart';

class Resalt extends StatelessWidget {
  final player = AudioPlayer();
  int score;
  int count;
  Resalt({super.key,required this.score, required this.count});


  @override
  Widget build(BuildContext context) {
    player.play(AssetSource("winsound.mp3"));
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Image.asset(Images.img7,fit: BoxFit.fill,height: double.infinity,width: double.infinity,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(Images.img10,height: 300,width: 300,),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Completed\n score: $score/$count",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25),),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      player.play(AssetSource("bottom.mp3"));
                    Navigator.pop(context);
                    },
                    child: Text("Go Home")
                )


              ],
            ),
          )
        ],
      )
    ));
  }
}
