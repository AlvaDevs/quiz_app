import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

/// Scrollable summary of all questions and answers
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 400,
    child: SingleChildScrollView(
      child: Column(
        children: summaryData.map((data) => SummaryItem(data)).toList(),
      ),
    ),
  );
}
