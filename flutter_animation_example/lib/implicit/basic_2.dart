import 'package:flutter/material.dart';

class ImplicitBasicExample2Screen extends StatefulWidget{
  @override
  State<ImplicitBasicExample2Screen> createState() => _ImplicitBasic2State();
}

class _ImplicitBasic2State extends State<ImplicitBasicExample2Screen> {

  double width = 100;
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 750),
            width: width,
            height: 100,
            color: Colors.blue,
          ),
          Divider(),
          Container(
            width: width,
            height: 100,
            color: Colors.blue,
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: 750),
            child: Container(
              width: 64,
              height: 64,
              color: Colors.green,
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  width = width == 100 ? 200 : 100;
                  opacity = opacity == 1 ? 0 : 1;
                });
              },
              child: Text('Switch'))
        ],
      ),
    );
  }
}