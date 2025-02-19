import 'package:flutter/material.dart';

/// Visual identifier showing question number and correctness
class QuestionsIdentifier extends StatelessWidget {
  const QuestionsIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) => Container(
    width: 30,
    height: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color:
          isCorrectAnswer
              ? const Color.fromRGBO(45, 212, 191, 1)
              : const Color.fromRGBO(255, 107, 107, 1),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      (questionIndex + 1).toString(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color:
            isCorrectAnswer
                ? const Color.fromRGBO(10, 52, 66, 1)
                : const Color.fromRGBO(74, 28, 28, 1),
      ),
    ),
  );
}
