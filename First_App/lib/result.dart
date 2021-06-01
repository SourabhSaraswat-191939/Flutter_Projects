import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'Woohhhh!! You Completed It ...';
    if (resultScore <= 6) {
      resultText = 'You Are Innocent And Awesome';
    } else if (resultScore <= 14) {
      resultText = 'You Are Good';
    } else if (resultScore <= 22) {
      resultText = 'You Are Strange Person';
    } else {
      resultText = 'You Are So Bad';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 220),
        alignment: Alignment.center,
        child: Center(
            child: Column(children: [
          Text(
            "Quiz Completed .",
            style: TextStyle(
                color: Colors.blue, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            resultPhrase,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 5),
          ),
          FlatButton(
              color: Colors.transparent,
              textColor: Colors.green[500],
              onPressed: resetHandler,
              child: Text("Restart Quiz"))
        ])));
  }
}
