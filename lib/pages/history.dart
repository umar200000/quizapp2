import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quizapp2/tools/hiveRep.dart';

import '../tools/images.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  HiveRep hiveRep = HiveRep();
  List<String> cpp = [];
  List<String> cpptime = [];
  List<String> java = [];
  List<String> javatime = [];
  List<String> python = [];
  List<String> pythontime = [];
  int controler = 0;
  final player1 = AudioPlayer();

  @override
  void initState() {
    java = hiveRep.getResultJ();
    javatime = hiveRep.getTimeJ();
    python = hiveRep.getResultP();
    pythontime = hiveRep.getTimeP();
    cpptime = hiveRep.getTime();
    cpp = hiveRep.getResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffA76AE4),
      body: Stack(
        children: [
          controler==0 ? Image.asset(Images.img6) : controler==1 ?  Image.asset(Images.img8) :  Image.asset(Images.img9) ,
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
            padding: const EdgeInsets.only(bottom: 200.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(controler==0?"C++ history results":controler==1?"Java history results" : "Python history results",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 30),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 395.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height/2,

                width: double.infinity,
                child: ListView.builder(
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          height: 50,
                          child: controler==0? Text("${index+1}.  result: ${cpp[index]}      ${cpptime[index]}",
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)
                          : controler==1 ? Text("${index+1}.  result: ${java[index]}      ${javatime[index]}",
                            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),):
                            Text("${index+1}.  result: ${python[index]}      ${pythontime[index]}",
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                        ),
                      );
                    },
                itemCount: controler==0 ? cpp.length : controler==1 ? java.length : python.length,
                ),
              ),
            ),
          )
        ],
      ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              setState(() {
                controler = index;
              });
            },
            currentIndex: controler,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.history_outlined),
              label: "C++",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.history_outlined),
                label: "Java",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.history_outlined),
                label: "Python",
              ),
            ],
          ),
    ));
  }
}
