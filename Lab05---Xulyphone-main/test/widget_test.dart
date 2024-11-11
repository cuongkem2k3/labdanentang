import 'package:flutter_test/flutter_test.dart';
import 'package:lab_5/main.dart';  // Thay 'your_project' bằng tên dự án của bạn.

void main() {
  testWidgets('Test MyApp widget', (WidgetTester tester) async {
    // Không cần sử dụng await nếu không có tác vụ async trong MyApp.
    await tester.pumpWidget(const MyApp());

    // Nếu cần đợi các frame kết thúc, sử dụng tester.pumpAndSettle()
    // await tester.pumpAndSettle();

    // Thực hiện các kiểm tra khác ở đây
    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
  });
}