import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../tools/images.dart';

class About extends StatelessWidget {
   About({super.key});
  final player1 = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: Stack(
        children: [
          Image.asset(Images.img7,height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
          Padding(
            padding: const EdgeInsets.only(top: 15,left: 10),
            child: IconButton(
                onPressed: (){
                    player1.play(AssetSource("bottom.mp3"));
                    Future.delayed(Duration(milliseconds: 400),(){
                      Navigator.pop(context);
                    });

                },
                icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30,)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 10,top: 200),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("This Quiz game is made by Umarjon Ruziev in 2023/10/23"
                  " this game is so interesting and useful if you play it you will definitely learn a lot of"
                  " knowledge about programming language in this game you should choose one of programming languages"
                  " after that there are questions and A,B,C,D answer tests you must select one of them when you finish"
                  " selecting all test after submiting you can see your result",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22),),
            ),
          )
        ],
      ),

    ));
  }
}
