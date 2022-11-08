import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.selectAnswer, required this.answerText})
      : super(key: key);
  final VoidCallback selectAnswer;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 120,
        child: ElevatedButton(
          onPressed: selectAnswer,
          child: Text(answerText),
        ));
  }
}
