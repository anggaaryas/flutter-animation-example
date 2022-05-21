import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveAdvanceExampleScreen extends StatefulWidget{
  @override
  State<RiveAdvanceExampleScreen> createState() => _RiveAdvanceExampleScreenState();
}

class _RiveAdvanceExampleScreenState extends State<RiveAdvanceExampleScreen> {

  /// Tracks if the animation is playing by whether controller is running.
  SMITrigger? _bump;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'Toggle Blending');
    artboard.addController(controller!);
    _bump = controller.findInput<bool>('Jump') as SMITrigger;
  }

  void _hitBump() => _bump?.fire();

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  GestureDetector(
        child: RiveAnimation.asset(
          "asset/jumpman.riv",
          fit: BoxFit.cover,
          onInit: _onRiveInit,
        ),
        onTap: _hitBump,
      ),
    );
  }
}