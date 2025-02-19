import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/questions_identifier.dart';

/// Individual item showing question result details
class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrect = itemData['chosen_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionsIdentifier(
            isCorrectAnswer: isCorrect,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildQuestionText(),
                const SizedBox(height: 5),
                _buildAnswerText(
                  itemData['chosen_answer'] as String,
                  isCorrect,
                ),
                _buildCorrectAnswerText(itemData['correct_answer'] as String),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionText() => Text(
    itemData['question'] as String,
    style: GoogleFonts.josefinSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  Widget _buildAnswerText(String text, bool isCorrect) => Text(
    text,
    style: TextStyle(
      color:
          isCorrect
              ? const Color.fromRGBO(45, 212, 191, 1)
              : const Color.fromRGBO(255, 107, 107, 1),
      fontWeight: FontWeight.w500,
    ),
  );

  Widget _buildCorrectAnswerText(String text) => Text(
    text,
    style: const TextStyle(
      color: Color.fromRGBO(224, 251, 252, 1),
      fontWeight: FontWeight.bold,
    ),
  );
}
