import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplicitBasicExampleScreen extends StatefulWidget {
  @override
  State<ExplicitBasicExampleScreen> createState() =>
      _ExplicitBasicExampleScreenState();
}

class _ExplicitBasicExampleScreenState
    extends State<ExplicitBasicExampleScreen> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> fanAngleAnimation;


  @override
  initState(){
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1750));
    fanAngleAnimation = Tween(begin: 0.0, end: 360.0).animate(animationController);
    super.initState();

    animationController..forward()
      ..addListener(() {
          setState((){});
        if (animationController.isCompleted) {
          animationController.repeat();
        }
      });
  }

  dispose(){
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        height: 84,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.blueGrey
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                color: Color.fromRGBO((fanAngleAnimation.value * 0.75).toInt(),(fanAngleAnimation.value * 0.2).toInt(),(fanAngleAnimation.value).toInt(),1),
                child: Center(child: Text('RTX 3090 SUper', style: GoogleFonts.staatliches(color: Colors.white),))),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 4,
                    bottom: 4.0,
                    child: Transform.rotate(angle: fanAngleAnimation.value,
                      child: Icon(Icons.settings, size: 64, color: Colors.yellow,),
                    ),
                  ),
                  Positioned(
                    right: 4,
                    bottom: 4.0,
                    child: Transform.rotate(angle: fanAngleAnimation.value,
                      child: Icon(Icons.settings, size: 64, color: Colors.yellow,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}