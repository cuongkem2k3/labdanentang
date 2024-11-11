import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

List<Story> _storyData = [
  Story(
      storyTitle:
          'Xe của bạn đã nổ lốp trên một con đường quanh co ở nơi hoang vắng không có sóng điện thoại. Bạn quyết định xin đi nhờ. Một chiếc xe bán tải cũ dừng lại bên cạnh bạn. Một người đàn ông đội mũ rộng vành với đôi mắt vô hồn mở cửa và hỏi: "Cần đi nhờ không, cậu trai?"',
      choice1: 'Tôi sẽ lên xe. Cảm ơn đã giúp đỡ!',
      choice2: 'Tốt hơn là nên hỏi ông ta có phải kẻ giết người không.'),
  Story(
      storyTitle: 'Ông ta từ từ gật đầu, không hề nao núng trước câu hỏi.',
      choice1: 'Ít nhất ông ấy cũng trung thực. Tôi sẽ lên xe.',
      choice2: 'Khoan đã, tôi biết cách thay lốp xe.'),
  Story(
      storyTitle:
          'Khi bạn bắt đầu đi, người lạ bắt đầu nói về mối quan hệ với mẹ mình. Ông ta càng lúc càng tức giận. Ông ta yêu cầu bạn mở hộp đựng đồ. Bên trong bạn tìm thấy một con dao dính máu, hai ngón tay bị cắt rời, và một băng cassette của Elton John. Ông ta với tay về phía hộp đựng đồ.',
      choice1: 'Tôi thích Elton John! Đưa ông ấy băng cassette.',
      choice2: 'Một sống, một còn! Bạn cầm dao và đâm ông ta.'),
  Story(
      storyTitle:
          'Gì cơ? Thật là vô lý! Bạn có biết tai nạn giao thông là nguyên nhân tử vong do tai nạn đứng thứ hai ở nhiều nhóm tuổi trưởng thành không?',
      choice1: 'Khởi động lại',
      choice2: ''),
  Story(
      storyTitle:
          'Khi xe lao qua hàng rào chắn và hướng về những tảng đá sắc nhọn bên dưới, bạn suy ngẫm về sự khôn ngoan của việc đâm người khi họ đang lái xe mà bạn đang ngồi trong đó.',
      choice1: 'Khởi động lại',
      choice2: ''),
  Story(
      storyTitle:
          'Bạn và người đàn ông sát nhân cùng hát bài "Can you feel the love tonight". Ông ta thả bạn ở thị trấn tiếp theo. Trước khi đi, ông ta hỏi bạn có biết nơi nào tốt để vứt xác không. Bạn trả lời: "Thử ở bến tàu xem".',
      choice1: 'Khởi động lại',
      choice2: '')
];


  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2;
  }
}
