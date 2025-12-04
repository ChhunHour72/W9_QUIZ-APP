import 'package:flutter/material.dart';
import '../model/quiz.dart';      
import '../data/questions.dart';   
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Quiz _quiz;
  int _currentQuestionIndex = 0;
  String _currentScreen = 'welcome'; 

  @override
  void initState() {
    super.initState();
    _quiz = Quiz(questions: questions);
  }

  void _startQuiz() {
    setState(() {
      _currentScreen = 'questions';
      _currentQuestionIndex = 0;
      _quiz.answers.clear();
    });
  }

  void _answerQuestion(String selectedChoice) {
    setState(() {
      Question currentQuestion = _quiz.questions[_currentQuestionIndex];
      _quiz.addAnswer(currentQuestion, selectedChoice);

      if (_currentQuestionIndex < _quiz.questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _currentScreen = 'result';
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _currentScreen = 'welcome';
      _currentQuestionIndex = 0;
      _quiz.answers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    if (_currentScreen == 'welcome') {
      screenWidget = WelcomeScreen(
        onStart: _startQuiz,
      );
    } else if (_currentScreen == 'questions') {
      screenWidget = QuestionScreen(
        question: _quiz.questions[_currentQuestionIndex],
        onAnswer: _answerQuestion,
      );
    } else {
      screenWidget = ResultScreen(
        score: _quiz.getScore(), 
        totalQuestions: _quiz.questions.length,
        onRestart: _restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue, 
        body: Center(
          child: screenWidget, 
        ),
      ),
    );
  }
}