import 'package:flutter/material.dart';
import 'package:flutter_animation_example/implicit/custom_implicit_widget.dart';

class CustomImplicitExampleScreen extends StatefulWidget{
  @override
  State<CustomImplicitExampleScreen> createState() => _CustomImplicitExampleScreenState();
}

class _CustomImplicitExampleScreenState extends State<CustomImplicitExampleScreen> {
  int value = 0;
  bool isLoop = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImplicitWidget(value: value, onEnd: (){
            if(isLoop){
              setState((){
                if(value > 300) {
                  value = 0;
                } else {
                  value += 10;
                }
              });
            }
          },),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              isLoop? Container():  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(onPressed: value == 0? null: (){
                    setState((){
                      if(value > 10) value -= 10;
                      else value = 0;
                    });
                  }, child: Text('- 10')),
                  OutlinedButton(onPressed: (){
                    setState((){
                      value+= 10;
                    });
                  }, child: Text('+ 10')),
                ],
              ),
              Checkbox(value: isLoop, onChanged: (value){
                setState((){
                  isLoop = !isLoop;
                  this.value += 10;
                });
              }),
              Text('Looping')
            ],
          )
        ],
      ),
    );
  }
}