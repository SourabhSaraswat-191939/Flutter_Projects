import 'package:flutter/material.dart';
import './drawer.dart';

class animatedContainer extends StatefulWidget {
  // const AnimatedContainer({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<animatedContainer> {
  bool _bigger = false;
  Curve _curveName = Curves.linearToEaseOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      drawer: drawer(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle  of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose Animation Type',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () => setState(() {
                    _curveName = Curves.bounceIn;
                  }),
                  child: Text('bounceIn'),
                ),
                RaisedButton(
                  onPressed: () => setState(() {
                    _curveName = Curves.linear;
                  }),
                  child: Text('linear'),
                ),
                RaisedButton(
                  onPressed: () => setState(() {
                    _curveName = Curves.easeInCubic;
                  }),
                  child: Text('easeInCubic'),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: _curveName,
                    width: _bigger ? 350 : 150,
                    child: Image.asset(
                      'assets/star.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => setState(() {
                      _bigger = !_bigger;
                    }),
                    child: Text('Animate'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
