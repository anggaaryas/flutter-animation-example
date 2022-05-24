import 'dart:math';

import 'package:flutter/material.dart';

class CustomImplicitWidget extends StatefulWidget{
  final int value;
  final Function()? onEnd;

  const CustomImplicitWidget({Key? key, required this.value, this.onEnd}) : super(key: key);

  @override
  State<CustomImplicitWidget> createState() => _CustomImplicitWidgetState();
}

class _CustomImplicitWidgetState extends State<CustomImplicitWidget> {

  int value = 0;


  @override
  void didUpdateWidget(CustomImplicitWidget oldWidget) {
    if(oldWidget.value != widget.value){
      value = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: value),
          duration: const Duration(milliseconds: 250),
          onEnd: widget.onEnd,
          builder: (ctx, v, child){
            return Wrap(
              children: [
                for(var i = 0; i < v; i++) Text('#', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255) , Random().nextInt(255), 1)
                ),)
              ],
            );
          }),
    );
  }
}