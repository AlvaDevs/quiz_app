import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

/// Screen displaying quiz results and restart option
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final VoidCallback onRestart;
  final List<String> chosenAnswers;

  int get _totalQuestions => questions.length;
  int get _correctAnswers =>
      chosenAnswers
          .where(
            (answer) =>
                answer == questions[chosenAnswers.indexOf(answer)].answers[0],
          )
          .length;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $_correctAnswers out of $_totalQuestions questions correctly!',
              style: GoogleFonts.josefinSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(202, 240, 248, 1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(_createSummaryData()),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, Object>> _createSummaryData() => List.generate(
    chosenAnswers.length,
    (index) => {
      'question_index': index,
      'question': questions[index].question,
      'correct_answer': questions[index].answers[0],
      'chosen_answer': chosenAnswers[index],
    },
  );
}
