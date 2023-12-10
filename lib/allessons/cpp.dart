import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/allessons/resalt.dart';
import 'package:quizapp2/tools/hiveRep.dart';
import 'package:quizapp2/tools/utils.dart';

import '../tools/audio.dart';
import '../tools/images.dart';
import '../tools/lessons.dart';

class CppPage extends StatefulWidget {
  const CppPage({super.key});

  @override
  State<CppPage> createState() => _CppPageState();
}

class _CppPageState extends State<CppPage> {
  HiveRep hiveRep = HiveRep();
  List<String> history = [];
  List<String> times = [];
  List<String> history2 = [];
  List<String> times2 = [];
  List<String> history3 = [];
  List<String> times3 = [];
  int index = 0;
  List<TestModel> list = [];
  String answer = "";
  int score = 0;
  String s = "";
  final player1 = AudioPlayer();
  final player = AudioPlayer();
  final player2 = AudioPlayer();
  final player5 = AudioPlayer();
  @override
  void initState() {
     times = hiveRep.getTime();
     history = hiveRep.getResult();
     times2 = hiveRep.getTimeJ();
     history2 = hiveRep.getResultJ();
     times3 = hiveRep.getTimeP();
     history3 = hiveRep.getResultP();
    s = hiveRep.getNames();
    list = s=="C++" ? cppQuestions : s=="Java" ? javaQuestions : pythonQuestions;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
         body: Stack(
           children: [
             s=="C++" ? Image.asset(Images.img6) : s=="Java" ? Image.asset(Images.img8) : Image.asset(Images.img9) ,
             Padding(
               padding: const EdgeInsets.only(top: 15.0,left: 10),
               child: IconButton(
                   onPressed: (){
    setState(() {
      player1.play(AssetSource("bottom.mp3"));
      Future.delayed(Duration(milliseconds: 200), () {
        showDialog(
            barrierDismissible: false,
            context: context, builder: (context){
          return Dialog(
            child: Container(
              height: 150,
              width: 200,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("are you sure to leave quiz?",style: TextStyle(color: Color(0xff5B1CAE),
                      fontSize: 18),),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          setState(() {
                            player.play(AssetSource("click.mp3"));
                            Future.delayed(Duration(milliseconds: 300), (){
                              Navigator.pop(context);
                            });
                          });
                        }, child: Text("no",style: TextStyle(color: Color(0xff5B1CAE),
                            fontSize: 18),)),
                        TextButton(onPressed: (){
                          setState(() {
                            player.play(AssetSource("click.mp3"));
                            Future.delayed(Duration(milliseconds: 300), (){
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });
                          });
                        }, child: Text("yes",style: TextStyle(color: Color(0xff5B1CAE),
                            fontSize: 18),)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      });
    });

                   },
                   icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30,)),
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
             Padding(padding: EdgeInsets.only(top: 260,left: 51),
             child: Container(
               height: 138,
               width: 316,
               child: Center(child: Text(list[index].question,textAlign: TextAlign.center,
                 style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Color(0xff5B1CAE)),)),
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(14),
                   boxShadow: [BoxShadow(
                     color:  Color(0xffC7A8FC),
                     blurRadius: 15,

                   )]
               ),
             ),),
             Padding(padding: EdgeInsets.only(top: 428, left: 48),
             child: Container(
               height: 55,
               width: 316,
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(14),
                   boxShadow: [BoxShadow(
                   color: answer == list[index].answerA? Colors.green : Color(0xffC7A8FC),
               blurRadius: answer == list[index].answerA? 0 : 15,
                  spreadRadius: answer == list[index].answerA? 2 : 0
               )]),
               child: MaterialButton(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                 onPressed: (){
                  setState(() {
                    player2.play(AssetSource('correct.wav'));
                    answer = list[index].answerA;
                  });
                 },
                 child: Row(
                   children: [
                     SizedBox(width: 5,),
                     Text("A", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                     SizedBox(width: 10,),
                     Expanded(child: Container(child: Center(child: Text(list[index].answerA,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,))))),
                   ],
                 ),
               ),
             ),
             ),
             Padding(padding: EdgeInsets.only(top: 510, left: 48),
               child: Container(
                 height: 55,
                 width: 316,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(14),
                     boxShadow: [BoxShadow(
                         color: answer == list[index].answerB? Colors.green : Color(0xffC7A8FC),
                         blurRadius: answer == list[index].answerB? 0 : 15,
                         spreadRadius: answer == list[index].answerB? 2 : 0
                     )]),
                 child: MaterialButton(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                   onPressed: (){

                  setState(() {
                    player2.play(AssetSource('correct.wav'));
                    answer = list[index].answerB;
                  });
                   },
                   child: Row(
                     children: [
                       SizedBox(width: 5,),
                       Text("B", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                       SizedBox(width: 10,),
                       Expanded(child: Container(child: Center(child: Text(list[index].answerB,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,))))),
                     ],
                   ),
                 ),
               ),
             ),
             Padding(padding: EdgeInsets.only(top: 593, left: 48),
               child: Container(
                 height: 55,
                 width: 316,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(14),
                     boxShadow: [BoxShadow(
                         color: answer == list[index].answerC? Colors.green : Color(0xffC7A8FC),
                         blurRadius: answer == list[index].answerC? 0 : 15,
                         spreadRadius: answer == list[index].answerC? 2 : 0
                     )]),
                 child: MaterialButton(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                   onPressed: (){
                     setState(() {
                       player2.play(AssetSource('correct.wav'));
                       answer = list[index].answerC;
                     });
                   },
                   child: Row(
                     children: [
                       SizedBox(width: 5,),
                       Text("C", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                       SizedBox(width: 10,),
                       Expanded(child: Container(child: Center(child: Text(list[index].answerC,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,))))),
                     ],
                   ),
                 ),
               ),
             ),
             Padding(padding: EdgeInsets.only(top: 677, left: 48),
               child: Container(
                 height: 55,
                 width: 316,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(14),
                     boxShadow: [BoxShadow(
                         color: answer == list[index].answerD? Colors.green : Color(0xffC7A8FC),
                         blurRadius: answer == list[index].answerD? 0 : 15,
                         spreadRadius: answer == list[index].answerD? 2 : 0
                     )]),
                 child: MaterialButton(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                   onPressed: (){
                     setState(() {
                       player2.play(AssetSource('correct.wav'));
                       answer = list[index].answerD;
                     });
                   },
                   child: Row(
                     children: [
                       SizedBox(width: 5,),
                       Text("D", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                       SizedBox(width: 10,),
                       Expanded(child: Container(child: Center(child: Text(list[index].answerD,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,))))),
                     ],
                   ),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(bottom: 15.0),
               child: Align(
                 alignment: Alignment.bottomCenter,
                 child: Container(
                   height: 60,
                   width: 190,
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary: Color(0xffA76AE4)
                     ),
                     onPressed: (){

                     setState(() {
                       player5.play(AssetSource("shuffle.mp3"));
                       if(answer.isEmpty){
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select your answer")));
                         return;
                       }
                       answer == list[index].correctAnswer ? score++ : "";
                       answer = "";
                       index++;
                       if(index==list.length) {
                         index--;
                        if(s=="C++"){
                          history.add("$score/${list.length}");
                          hiveRep.saveResult(history);
                          String now = nowDay();
                          times.add(now);
                          hiveRep.saveTime(times);
                        }else if(s=="Java"){
                          history2.add("$score/${list.length}");
                          hiveRep.saveResultJ(history2);
                          String now = nowDay();
                          times2.add(now);
                          hiveRep.saveTimeJ(times2);
                        }else{
                          history3.add("$score/${list.length}");
                          hiveRep.saveResultP(history3);
                          String now = nowDay();
                          times3.add(now);
                          hiveRep.saveTimeP(times3);
                        }
                         Navigator.pushReplacement(context, CupertinoPageRoute(
                             builder: (context) =>
                                 Resalt(score: score, count: list.length,)));
                       }

                     });
                     },
                     child: Text(index==list.length-1 ? "Submit" :"Next",style: TextStyle(
                       color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500
                     ),),
                   ),
                 ),
               ),
             )
           ],
         ),
    ));
  }

  nowDay(){
    DateTime day = DateTime.now();
    String now = day.toString();
    int index1 = now.indexOf('.');
    now = now.substring(0,index1);
    return now;
  }

}
