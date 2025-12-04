import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key, 
    required this.score, 
    required this.totalQuestions, 
    required this.onRestart
  });
   
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "You finished!", 
          style: TextStyle(fontSize: 28, color: Colors.white)
        ),
        Text(
          "Your score: $score / $totalQuestions", 
          style: const TextStyle(fontSize: 20, color: Colors.white)
        ),
        const SizedBox(height: 30),
        AppButton("Restart Quiz", onTap: onRestart),
      ],
    );
  }
}
 