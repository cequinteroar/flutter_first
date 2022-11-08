import 'package:first_app/quiz.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // const MyHomePage({Key? key}) : super(key: key);
  var _questionIndex = 0; //  _ signlizes private property
  int _totalScore = 0;

  final questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Red", "score": 2},
        {"text": "White", "score": 1},
        {"text": "Black", "score": 5},
        {"text": "Blue", "score": 6}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Cat", "score": 10},
        {"text": "Dog", "score": 6},
        {"text": "Rabbit", "score": 1},
        {"text": "Snake", "score": 4},
        {"text": "Elephant", "score": 9},
        {"text": "Lion", "score": 8},
        {"text": "Mockingbird", "score": 7},
      ]
    },
    {
      "questionText": "Who's your favorite scientis?",
      "answers": [
        {"text": "Marie Curie", "score": 8},
        {"text": "Albert Einstein", "score": 9},
        {"text": "Nicola Tesla", "score": 7},
        {"text": "Me", "score": 10},
        {"text": "Dexter", "score": 3},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex < questions.length) {
      _totalScore += score;
      setState(() {
        _questionIndex++;
      });
      print(_questionIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My First App"),
      ),
      body: _questionIndex < questions.length
          ? Column(children: <Widget>[
              const Text("Quiz App!"),
              Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: questions),
            ])
          : Result(resultScore: _totalScore, resetHandler: _resetQuiz),
    );
  }
}
