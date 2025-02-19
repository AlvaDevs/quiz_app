import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

/// Root widget managing application state and navigation
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  /// Transitions to questions screen
  void _switchScreen() => setState(() => _activeScreen = 'questions-screen');

  /// Handles answer selection and progress tracking
  void _handleAnswerSelection(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() => _activeScreen = 'results-screen');
    }
  }

  /// Resets quiz to initial state
  void _restartQuiz() => setState(() {
    _selectedAnswers.clear();
    _activeScreen = 'start-screen';
  });

  @override
  Widget build(BuildContext context) {
    final gradientColors = const [
      Color.fromRGBO(3, 4, 94, 1),
      Color.fromRGBO(0, 119, 182, 1),
      Color.fromRGBO(0, 180, 216, 1),
      Color.fromRGBO(144, 224, 239, 1),
      Color.fromRGBO(202, 240, 248, 1),
    ];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
          ),
          child: _buildActiveScreen(),
        ),
      ),
    );
  }

  /// Determines current screen based on application state
  Widget _buildActiveScreen() {
    switch (_activeScreen) {
      case 'questions-screen':
        return QuestionsScreen(onSelectedAnswer: _handleAnswerSelection);
      case 'results-screen':
        return ResultsScreen(
          chosenAnswers: _selectedAnswers,
          onRestart: _restartQuiz,
        );
      default:
        return StartScreen(_switchScreen);
    }
  }
}
