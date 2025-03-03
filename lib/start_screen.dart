import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Initial screen with quiz introduction and start button
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final VoidCallback startQuiz;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromRGBO(255, 255, 255, 0.65),
        ),
        const SizedBox(height: 80),
        Text(
          'Learn Flutter the fun way!',
          style: GoogleFonts.josefinSans(
            color: const Color.fromRGBO(51, 51, 51, 1),
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromRGBO(51, 51, 51, 1),
          ),
          icon: const Icon(Icons.play_arrow),
          label: const Text('Start Quiz'),
        ),
      ],
    ),
  );
}
