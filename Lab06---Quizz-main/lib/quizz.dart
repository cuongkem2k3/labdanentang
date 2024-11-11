
import 'package:flutter/material.dart';
import '../service.dart';
import '../question.dart';

class Quizz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quizz> {
  final Service _quizService = Service();
  int _currentQuestionIndex = 0;
  int _score = 0; // Biến để theo dõi điểm số
  List<Icon> _scoreKeeper = []; // Danh sách biểu tượng để hiển thị điểm số

  void _checkAnswer(bool userAnswer) {
    final bool correctAnswer = _quizService.questions[_currentQuestionIndex].answer;

    setState(() {
      if (userAnswer == correctAnswer) {
        _score++; // Tăng điểm nếu trả lời đúng
        _scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        _scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      if (_currentQuestionIndex < _quizService.questions.length - 1) {
        _currentQuestionIndex++; // Chuyển đến câu hỏi tiếp theo
      } else {
        // Bạn có thể thêm logic để hiển thị kết quả ở đây
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text('Your score: $_score/${_quizService.questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentQuestionIndex = 0; // Đặt lại câu hỏi
                  _score = 0; // Đặt lại điểm số
                  _scoreKeeper = []; // Đặt lại danh sách điểm
                });
              },
              child: Text('Play again'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = _quizService.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Quizzler')),
      body: Container(
      color: Color(0xFF2E3756),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                currentQuestion.questionText,
                style: TextStyle(fontSize: 24.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _checkAnswer(true),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E3756), // Màu nền của nút
                foregroundColor: Colors.white, // Màu chữ của nút
                side: BorderSide(color: Colors.white, width: 2), // Viền trắng
             ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0), // Thêm padding cho nút
              child: Text('True'),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _checkAnswer(false),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E3756),
                foregroundColor: Colors.white, 
                side: BorderSide(color: Colors.white, width: 2),
             ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0), // Thêm padding cho nút
              child: Text('False'),
           ),
          ),
           SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0), // Thêm padding 16 pixel ở tất cả các cạnh
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Giữa hàng
            children: _scoreKeeper, // Hiển thị biểu tượng điểm
          ),
          ),
        ],
      ),
      ),
    );
  }
}