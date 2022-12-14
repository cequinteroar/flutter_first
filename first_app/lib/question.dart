import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {
  const Question({Key? key, required this.questionText});
  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Text(
          questionText,
          style: const TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
