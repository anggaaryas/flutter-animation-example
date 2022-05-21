import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplicitAdvanceExampleScreen  extends StatefulWidget{
  @override
  State<ExplicitAdvanceExampleScreen> createState() => _ExplicitAdvanceExampleScreenState();
}

class _ExplicitAdvanceExampleScreenState extends State<ExplicitAdvanceExampleScreen> with TickerProviderStateMixin{

  late AnimationController animationController;
  late AnimationController valueController;
  late Animation<double> waterTween;
  late Animation<double> valueTween;

  double value = 50;

  @override
  initState(){
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 6000));
    waterTween = Tween(begin: 0.0, end: 360.0).animate(animationController);

    valueController = AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    valueTween = Tween(begin: 0.0, end: value, ).animate(CurvedAnimation(parent: valueController, curve: Curves.easeIn));

    super.initState();

    animationController..forward()
      ..addListener(() {
        setState((){});
        if (animationController.isCompleted) {
          animationController.repeat();
        }
      });
    valueController.forward();
  }

  dispose(){
    animationController.dispose();
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPaint(
            painter: MyPainter(waterTween.value, valueTween.value),
            child: Stack(
              children:[
                Container(
                  height: 300,
                  width: 180,
                  decoration: BoxDecoration(
                    border: Border.all()
                  ),
                ),
                Positioned(
                  top: 50,
                  child: Container(
                      width: 180,
                      child: Center(child: Text('${valueTween.value.toStringAsFixed(2)} %', style: GoogleFonts.pressStart2p(fontSize: 14),))),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(onPressed: value == 20? null: (){
                valueController.stop();
                valueTween = Tween<double>(begin: valueTween.value, end: value - 10).animate(CurvedAnimation(parent: valueController, curve: Curves.easeOut));
                valueController.reset();
                valueController.forward();
                value -= 10;
              }, child: Text('-')),

              OutlinedButton(onPressed: value == 80 ? null: (){
                valueController.stop();
                valueTween = Tween(begin: valueTween.value, end: value + 10).animate(CurvedAnimation(parent: valueController, curve: Curves.easeOut));
                valueController.reset();
                valueController.forward();
                value += 10;
              }, child: Text('+'),),

            ],
          ),
          SizedBox(height: 32,)
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double offset;
  final double percent;

  MyPainter(this.offset, this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xff3B6ABA).withOpacity(.8).withRed((255 * (100 - percent) / 100).toInt())
      ..style = PaintingStyle.fill;

    var path = Path();

    var i = 0.0;
    while(i < size.width){
      path.lineTo(i, sin((i + offset + percent) * 5 * pi / 180) * 10 + size.height * ((100 - percent) / 100));
      i += 0.1;
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}