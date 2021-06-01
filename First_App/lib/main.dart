import 'dart:ui';

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Black', 'score': 8},
        {'text': 'Blue', 'score': 3},
        {'text': 'Yellow', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favourite food ?',
      'answers': [
        {'text': 'Apple', 'score': 1},
        {'text': 'Banana', 'score': 7},
        {'text': 'Mango', 'score': 2},
        {'text': 'Grapes', 'score': 5}
      ]
    },
    {
      'questionText': 'What\'s your favourite Subject ?',
      'answers': [
        {'text': 'Maths', 'score': 8},
        {'text': 'English', 'score': 4},
        {'text': 'Coding', 'score': 1},
        {'text': 'Science', 'score': 6}
      ]
    }
  ];

  var _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
      if (_questionIndex < _questions.length) {
        print("There Are More Questions .");
      } else {
        print("No More Question Left .");
      }
    });
    print('Answer Chosen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sourabh'),
          backgroundColor: Colors.green[500],
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
