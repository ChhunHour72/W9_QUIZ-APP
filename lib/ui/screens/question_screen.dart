import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/app_button.dart';
 
class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(String) onAnswer; 

  const QuestionScreen({
    super.key, 
    required this.question, 
    required this.onAnswer
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question.title,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 20),
        ...question.options.map((option) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AppButton(option, onTap: () => onAnswer(option)),
          );
        }),
      ],
    );
  }
}
 