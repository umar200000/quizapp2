import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/pages/history.dart';
import 'package:quizapp2/pages/quizPage.dart';


import '../tools/audio.dart';
import '../tools/images.dart';
import 'about.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final player = AudioPlayer();
  final player1 = AudioPlayer();


  @override
  void initState() {
    player10.play(AssetSource("quiz.mp3"));
    player10.setReleaseMode(ReleaseMode.loop);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

         body: Stack(
           children: [
             Image.asset(Images.img2),
             Padding(
               padding: const EdgeInsets.only(bottom: 100.0),
               child: Align(
                 alignment: Alignment.center,
                 child: container("Quiz"),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 153),
               child: Align(
                 alignment: Alignment.center,
                 child: container("Settings"),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 412),
               child: Align(
                 alignment: Alignment.center,
                 child: container("History"),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 675),
               child: Align(
                 alignment: Alignment.center,
                 child: container("About"),
               ),
             ),





           ],
         ),

    ));
  }

  Widget container(String text){

    return Container(
      height: 95,
      width: 316,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(
          color:  Color(0xffC7A8FC),
          blurRadius: 15,

        )]
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        onPressed: (){
          player.play(AssetSource("interfes.mp3"));
          Future.delayed(Duration(milliseconds: 400),(){
            if(text=="Quiz"){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>QuizPage()));
            }else  if(text=="About"){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>About()));
            } else  if(text=="History"){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>History()));
            }else{
              showDialog(context: context,
                  builder: (context){
                return StatefulBuilder(builder: (context,setState){
                  return  Dialog(
                    child: Container(
                      height: 300,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            MaterialButton(
                                onPressed: (){
                                  setState(() {
                                    z = 1;
                                  });
                                  player1.play(AssetSource("bottom.mp3"));
                                  player10.pause();

                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.music_off,size: 50,color: z==1 ? Colors.blue : Colors.black),
                                    SizedBox(width: 10,),
                                    Text("turn off music",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22, color: z==1 ? Colors.blue : Colors.black),)
                                  ],
                                )
                            ),
                            SizedBox(height: 30,),
                            MaterialButton(
                                onPressed: (){
                                  setState(() {
                                    z = 2;
                                  });
                                  player1.play(AssetSource("bottom.mp3"));
                                  player10.resume();

                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.music_note_sharp,size: 50,color: z==2 ? Colors.blue : Colors.black),
                                    SizedBox(width: 10,),
                                    Text("turn on music",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: z==2 ? Colors.blue : Colors.black),)
                                  ],
                                )
                            ),
                            SizedBox(height: 30,),
                            Center(child: Container(
                                height: 50,
                                width: 180,
                                child: ElevatedButton(onPressed: (){
                                  player1.play(AssetSource("bottom.mp3"));
                                  Future.delayed(Duration(milliseconds: 400),(){
                                    Navigator.pop(context);
                                  });
                                }, child: Text("go back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),))))
                          ],
                        ),
                      ),
                    ),
                  );
                });
                  },

              );
            }
          });

        },
        child: Text(text, style: TextStyle(color: Color(0xff5B1CAE),fontSize: 35,fontWeight: FontWeight.w500),),
      ),

    );
  }

}
