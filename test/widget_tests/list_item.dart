import 'package:behivecompanion/presentation/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testWith(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('Text Fields are set Correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      testWith(
        ListItem(
          title: 'Title',
          subtitle: 'Subtitle',
        ),
      ),
    );

    final titleFinder = await find.text('Title');
    final subtitleFinder = await find.text('Subtitle');

    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
  });
}
