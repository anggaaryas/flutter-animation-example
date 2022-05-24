import 'package:flutter/material.dart';
import 'package:flutter_animation_example/explicit/advance.dart';
import 'package:flutter_animation_example/explicit/basic.dart';
import 'package:flutter_animation_example/implicit/basic.dart';
import 'package:flutter_animation_example/implicit/using_custom_implicit.dart';
import 'package:flutter_animation_example/lottie/basic.dart';
import 'package:flutter_animation_example/rive/advance.dart';
import 'package:flutter_animation_example/rive/basic.dart';
import 'package:google_fonts/google_fonts.dart';

import 'implicit/basic_2.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MenuScreen> {
  int index = 0;
  List<Map> menus = [
    {'title': 'Implicit (basic)',
      'screen': ImplicitBasicExample2Screen()
    },
    {'title': 'Implicit (basic)',
      'screen': ImplicitBasicExampleScreen()
    },
    {'title': ' Custom Implicit',
      'screen': CustomImplicitExampleScreen()
    },
    {'title': 'Explicit (basic)',
      'screen': ExplicitBasicExampleScreen()
    },
    {'title': 'Explicit (advance)',
      'screen': ExplicitAdvanceExampleScreen()
    },
    {'title': 'Lottie (basic)',
      'screen': LottieBasicExampleScreen()
    },
    {'title': 'Rive (basic)',
      'screen': RiveBasicExampleScreen()
    },
    {'title': 'Rive (advance)',
      'screen': RiveAdvanceExampleScreen()
    },
  ];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text('Animation', style: GoogleFonts.getFont('Indie Flower', fontSize: 42, fontWeight: FontWeight.bold),)),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 750),
                      left: MediaQuery.of(context).size.width * (index + 1) / (menus.length + 2),
                      bottom: 0,
                      child: SizedBox(
                          height: 48,
                          child: Image.asset('asset/ship.png')))
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all()
                  ),
                  child: menus[index]['screen'],
                )),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(onPressed: index == 0? null: (){
                  setState((){
                    if(index > 0) index--;
                  });
                }, child: Text('-')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text('${menus[index]['title']}'),
                ),
                OutlinedButton(onPressed: index == menus.length - 1 ? null: (){
                  setState((){
                    if(index < menus.length - 1) index++;
                  });
                }, child: Text('+'),),

              ],
            ),
            SizedBox(height: 32,)
          ],
        ),
      ),
    );
  }
}
