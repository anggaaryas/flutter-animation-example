import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveBasicExampleScreen extends StatefulWidget{
  @override
  State<RiveBasicExampleScreen> createState() => _RiveBasicExampleScreenState();
}

class _RiveBasicExampleScreenState extends State<RiveBasicExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RiveAnimation.asset('asset/bluebot.riv'),
    );
  }
}