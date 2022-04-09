import 'dart:async';
import 'package:flutter/material.dart';

class BreathAnimation extends StatefulWidget {
  @override
  _BreathAnimationState createState() => _BreathAnimationState();
}

class _BreathAnimationState extends State<BreathAnimation> with TickerProviderStateMixin{
  int count=0;
  late AnimationController _breatheController;
  var _breathe =0.0;

  @override
  void initState() {
    super.initState();
    _breatheController = AnimationController(
        vsync: this, duration: Duration(seconds: 5));

    _breatheController.addStatusListener((status) async {
      if(status == AnimationStatus.completed){
        Timer(
            Duration(seconds: 5),
                () => (_breatheController.reverse())
        );
        //_breatheController.reverse();
      } else if (status == AnimationStatus.dismissed){
        _breatheController.forward();
      }
    });
    _breatheController.addListener(() {
      setState(() {
        _breathe =_breatheController.value;
      });
    });
    _breatheController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = 100 + 150.0 * _breathe;

    return
        Container(
              height: size,
              width:size,
              child: Material(
                //borderRadius: BorderRadius.circular(size/3),
                borderRadius: BorderRadius.circular(100),
                color: Color(0xFFF1D1FC),
                child: Icon(
                  Icons.favorite,
                  size:70,
                  color:Color(0xFFF59FC9),
                ),
              ),
        );
  }
}