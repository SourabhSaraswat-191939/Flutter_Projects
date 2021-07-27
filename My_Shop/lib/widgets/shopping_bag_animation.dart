import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class SineCurve extends Curve {
  final double count;
  SineCurve({this.count = 2});
  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    // var val = sin(2 * pi * t);
    return val; //f(x)
  }
}

class ShoppingBagAnimation extends StatefulWidget {
  final double size;
  final double left;
  const ShoppingBagAnimation(this.size, this.left);

  @override
  _ShoppingBagAnimationState createState() => _ShoppingBagAnimationState();
}

class _ShoppingBagAnimationState extends State<ShoppingBagAnimation> {
  bool animate = true;
  Timer timer;
  @override
  void initState() {
    // print('initState');
    timer = Timer.periodic(Duration(seconds: 2), (_) {
      setState(() {
        // print('check');
        animate = !animate;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      AnimatedPositioned(
        duration: Duration(seconds: 2),
        top: animate ? 10 : 45,
        left: widget.left,
        child: Icon(
          Icons.shopping_bag_rounded,
          size: widget.size,
          color: Colors.amber,
        ),
        curve: SineCurve(),
      ),
    ]);
  }
}
