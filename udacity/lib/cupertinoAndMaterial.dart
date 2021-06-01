import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class toggle extends StatefulWidget {
  @override
  _toggleState createState() => _toggleState();
}

class _toggleState extends State<toggle> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toggle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Expamples",
              style: TextStyle(color: Colors.blue, fontSize: 40, height: 2),
            ),
            Text("Cupertino Switch"),
            CupertinoSwitch(
              value: isSwitched,
              onChanged: toggleSwitch,
            ),
            SizedBox(
              height: 80,
            ),
            Text("Material Switch"),
            Switch(
              value: isSwitched,
              onChanged: toggleSwitch,
            ),
          ],
        ),
      ),
    );
  }
}
