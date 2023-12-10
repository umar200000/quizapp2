import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quizapp2/pages/mainPage.dart';

import '../tools/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Image.asset(Images.img1,height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
          Align(
            alignment: Alignment.center,
            child: Text("QuizApp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 40),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white, size: 40,),
            ),
          )
        ],
      ),
    ));
  }
}
