import 'package:flutter/material.dart';
import '../widgets/shopping_bag_animation.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
          width: double.infinity,
          height: 210,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.amber, width: 5),
            shape: BoxShape.circle,
          ),
          child: ShoppingBagAnimation(
              150, MediaQuery.of(context).size.width * 0.185),
        ),
        Text(
          'Shopping App',
          style: TextStyle(
            color: Theme.of(context).accentTextTheme.title.color,
            fontFamily: 'Anton',
            fontSize: 50,
            fontWeight: FontWeight.normal,
          ),
        ),
      ]),
    );
  }
}
