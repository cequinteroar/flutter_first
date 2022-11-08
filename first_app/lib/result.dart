import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.resultScore, required this.resetHandler})
      : super(key: key);
  final int resultScore;
  final VoidCallback resetHandler;
  String get resultString {
    String resultText = "Well done";
    if (resultScore < 10) {
      resultText = "Well, it could be better";
    } else if (resultScore < 20) {
      resultText = "Not Bad";
    } else {
      resultText = "You're awesome";
    }
    resultText = "$resultText, You got $resultScore points";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultString,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: resetHandler,
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(color: Colors.blueAccent)),
              child: const Text("Restart Quiz!")),
        ],
      ),
    );
  }
}
