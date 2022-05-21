import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieBasicExampleScreen extends StatefulWidget{
  @override
  State<LottieBasicExampleScreen> createState() => _LottieBasicExampleScreenState();
}

class _LottieBasicExampleScreenState extends State<LottieBasicExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('asset/rocket.json', width: 200, height: 200),
    );
  }
}