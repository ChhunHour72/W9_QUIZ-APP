import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

 class WelcomeScreen extends StatelessWidget {

  final VoidCallback onStart;
  const WelcomeScreen({super.key,required this.onStart});
   
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/quiz-logo.png', 
          width: 200,
        ),
        const Text("QUIZ APP", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 40),
        AppButton("Start Quiz", onTap: onStart), 
      ],
    );
  }
}
 
