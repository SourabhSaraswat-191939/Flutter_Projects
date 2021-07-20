import 'dart:math' as math;
import 'package:flutter/material.dart';
import './drawer.dart';

class tweenAnimationBuilder extends StatefulWidget {
  // const tweenAnimationBuilder({ Key? key }) : super(key: key);
  static const routeName = "/tweenAnimation";

  @override
  _tweenAnimationBuilderState createState() => _tweenAnimationBuilderState();
}

class _tweenAnimationBuilderState extends State<tweenAnimationBuilder> {
  double ending = 2 * math.pi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation Builder'),
      ),
      drawer: drawer(),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: TweenAnimationBuilder(
                  child: Image.asset('assets/star.png'),
                  duration: Duration(seconds: 2),
                  tween: Tween<double>(begin: 0, end: ending),
                  onEnd: () {
                    setState(() {
                      ending = ending == 2 * math.pi ? 0 : 2 * math.pi;
                    });
                  },
                  builder: (_, double angle, Widget myChild) {
                    //myChild will have the value of Child of TweenAnimationBuilder()
                    return Transform.rotate(
                      angle: angle,
                      child: myChild,
                      // child: Text("Star"),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: colorFilter(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class colorFilter extends StatefulWidget {
  // const colorFilter({Key? key}) : super(key: key);

  @override
  _colorFilterState createState() => _colorFilterState();
}

class _colorFilterState extends State<colorFilter> {
  double _sliderValue = 0;
  Color _newColor = Colors.white;
  // static final _colorTween = ColorTween(begin: Colors.white, end: _newColor); // to optimize widget rebuilding.

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TweenAnimationBuilder(
          tween: ColorTween(begin: Colors.white, end: _newColor),
          duration: Duration(seconds: 1),
          curve: Curves.bounceInOut,
          builder: (_, Color color, __) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(color, BlendMode.modulate),
              child: Image.asset('assets/star.png'),
            );
          }),
      Slider.adaptive(
          value: _sliderValue,
          onChanged: (double value) {
            setState(() {
              _sliderValue = value;
              _newColor = Color.lerp(Colors.white, Colors.red, _sliderValue);
            });
          })
    ]);
  }
}
