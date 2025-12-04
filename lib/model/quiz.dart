
class Question {
  final String title;
  final List<String> options; 
  final String correctOption; 

  Question({
    required this.title,
    required this.options,
    required this.correctOption,
  });
}

class Answer {
  final String answerChoice; 
  final Question question;  

  Answer({required this.answerChoice, required this.question});

  bool isCorrect() {
    return answerChoice == question.correctOption;
  }
}
class Quiz {
  final List<Question> questions; 
  final List<Answer> answers = []; 

  Quiz({required this.questions});

  int getScore() {
    int score = 0;
    for (Answer answer in answers) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
  }

  void addAnswer(Question question, String choice) {
    answers.add(Answer(question: question, answerChoice: choice));
  }
}