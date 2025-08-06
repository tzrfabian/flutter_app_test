// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_test/app.dart';

// import 'package:flutter_app_test/main.dart';

void main() {
  testWidgets('User Information Form Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp()); // Build our app and trigger a frame.

    // Verify that the form is displayed.
    expect(find.text('Please enter your information:'), findsOneWidget);

    // Verify that the name input field is present.
    expect(find.text('Please enter your information:'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Age'), findsOneWidget);
    expect(find.text('Job'), findsOneWidget);
    expect(find.text('Submit & Show Info'), findsOneWidget);
    expect(find.text('Clear Form'), findsOneWidget);
  });

  testWidgets('Submit and Show User Info', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp()); // Build our app and trigger a frame.

    // Enter text into the name, age, and job fields.
    await tester.enterText(find.byType(TextFormField).at(0), 'Jane Doe');
    await tester.enterText(find.byType(TextFormField).at(1), '30');
    await tester.enterText(find.byType(TextFormField).at(2), 'Software Engineer');

    // Tap the submit button.
    await tester.tap(find.text('Submit & Show Info'));
    await tester.pumpAndSettle();

    // Verify that the UserInfoDialog is displayed with correct information.
    expect(find.text('User Information'), findsOneWidget);
    expect(find.text('Name: Jane Doe'), findsOneWidget);
    expect(find.text('Age: 30'), findsOneWidget);
    expect(find.text('Job: Software Engineer'), findsOneWidget);
  });

  testWidgets('Clear Form Functionality', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp()); // Build our app and trigger a frame.

    // Enter text into the name, age, and job fields.
    await tester.enterText(find.byType(TextFormField).at(0), 'Jane Doe');
    await tester.enterText(find.byType(TextFormField).at(1), '25');
    await tester.enterText(find.byType(TextFormField).at(2), 'Data Scientist');

    // Tap the clear button.
    await tester.tap(find.text('Clear Form'));
    await tester.pumpAndSettle();

    // Verify that the form fields are cleared.
    expect(find.text('Jane Doe'), findsNothing);
    expect(find.text('25'), findsNothing);
    expect(find.text('Data Scientist'), findsNothing);
  });
}
