// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    await tester.pumpWidget(const AppEntry());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    VisibilityDetectorController.instance.notifyNow();

    expect(find.textContaining('Najeeb'), findsWidgets);
  });
}
