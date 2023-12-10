import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/allessons/cpp.dart';
import 'package:quizapp2/tools/hiveRep.dart';
import 'package:quizapp2/tools/utils.dart';

import '../tools/audio.dart';
import '../tools/images.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final player = AudioPlayer();
  final player1 = AudioPlayer();
  HiveRep hiveRep = HiveRep();
  @override
  void initState() {
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
          body: Stack(
            children: [
              Image.asset(Images.img2),
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 10),
                child: IconButton(
                    onPressed: (){
                     setState(() {
                       player1.play(AssetSource("bottom.mp3"));
                       Future.delayed(Duration(milliseconds: 400),(){
                         Navigator.pop(context);
                       });
                     });
                    },
                    icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: (){
                   setState(() {
                     if(z==2){
                       z = 1;
                       player10.pause();
                     }else{
                       z = 2;
                       player10.resume();
                     }
                   });
                  },
                  icon: z==2 ? Icon(Icons.music_note,size: 50,color: Colors.blue,) : Icon(Icons.music_off,size: 50,color: Colors.black,) ,
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 309),
                child: ListView.builder(
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.only(top: 26,left: 56,right: 39),
                        child: Container(
                          height: 130,
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
                            onPressed: () async{

                               player.play(AssetSource("interfes.mp3"));
                               await Future.delayed(Duration(milliseconds: 400), (){
                                 if(lessons[index].name=="C++"){
                                   hiveRep.saveNames("C++");
                                   Navigator.push(context, CupertinoPageRoute(builder: (context)=>CppPage()));
                                 } else  if(lessons[index].name=="Java"){
                                   hiveRep.saveNames("Java");
                                   Navigator.push(context, CupertinoPageRoute(builder: (context)=>CppPage()));
                                 } else  if(lessons[index].name=="Python"){
                                   hiveRep.saveNames("Python");
                                   Navigator.push(context, CupertinoPageRoute(builder: (context)=>CppPage()));
                                 }

                               setState(() {

                               });
                             });
                            },
                            child: Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 25,),
                                child: Image.asset(lessons[index].icon,height: 85,width: 85,),
                                ),
                                Container(
                                  height: 45,
                                  width: 170,
                                  child: Center(
                                    child: Text(lessons[index].name,style: TextStyle(
                                      fontWeight: FontWeight.w500,fontSize: 35,color: Color(0xff5B1CAE)
                                    ),),
                                  ),
                                )

                              ],
                            ),
                          ),


                        ),
                      );
                    },
                  itemCount: lessons.length,
                ),
              ),
            ],
          ),
    ));
  }
}
