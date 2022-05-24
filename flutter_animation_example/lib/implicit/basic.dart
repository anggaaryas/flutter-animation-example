import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImplicitBasicExampleScreen extends StatefulWidget {
  @override
  State<ImplicitBasicExampleScreen> createState() =>
      _ImplicitBasicExampleScreenState();
}

class _ImplicitBasicExampleScreenState
    extends State<ImplicitBasicExampleScreen> {
  double rotate = 1;
  double rtxWidth = 170;
  bool isSingleFan = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 750),
            width: rtxWidth,
            height: rtxWidth == 170 ? 84 : 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.blueGrey),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    color: Colors.grey,
                    child: Center(
                        child: Text(
                      'RTX 3090 SUper',
                      style: GoogleFonts.staatliches(color: Colors.white),
                    ))),
                Expanded(
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 750),
                        width: rtxWidth,
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 750),
                        left: rtxWidth == 170 ? 4 : 18,
                        bottom: 4.0,
                        child: AnimatedRotation(
                          turns: rotate * 5,
                          duration: Duration(milliseconds: 1250),
                          child: Icon(
                            Icons.settings,
                            size: 64,
                            color: Colors.yellow,
                          ),
                          curve: Curves.bounceOut,
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 750),
                        right: rtxWidth == 170 ? 4 : 18,
                        bottom: 4.0,
                        child: AnimatedRotation(
                          turns: rotate * 5,
                          duration: Duration(milliseconds: 1250),
                          child: Icon(
                            Icons.settings,
                            size: 64,
                            color: Colors.yellow,
                          ),
                          curve: Curves.bounceOut,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                  value: isSingleFan,
                  onChanged: (value) {
                    setState(() {
                      isSingleFan = !isSingleFan;
                      rotate = rotate == 1 ? 1.3 : 1;
                      rtxWidth = rtxWidth == 170 ? 100 : 170;
                    });
                  }),
              Text('Single fan')
            ],
          ),
        ],
      ),
    );
  }
}
