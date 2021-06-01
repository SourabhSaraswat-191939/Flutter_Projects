import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  @override
  final Function selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        color: Colors.green[200],
        onPressed: selectHandler,
      ),
    );
  }
}
