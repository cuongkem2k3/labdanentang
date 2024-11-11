
import '../question.dart';

class Service {
  final List<Question> _questions = [
    Question(questionText: 'Is the capital of Japan Tokyo?', answer: true),
    Question(questionText: 'Can dogs fly?', answer: false),
    Question(questionText: 'Is the largest ocean the Pacific Ocean?', answer: true),
    Question(questionText: 'Is 5 a prime number?', answer: true),
    Question(questionText: 'Is the human body made up of 206 bones?', answer: true),
    Question(questionText: 'Does the sun rise in the west?', answer: false),
    Question(questionText: 'Is the currency of the United States the dollar?', answer: true),
    Question(questionText: 'Is Mount Everest the tallest mountain in the world?', answer: true),
    Question(questionText: 'Is water composed of hydrogen and oxygen?', answer: true),
    Question(questionText: 'Is Shakespeare a famous painter?', answer: false),
  ];
  List<Question> get questions => _questions;
}
