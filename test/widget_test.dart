import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attende/pages/login_page.dart'; // Ensure the correct import path for LoginPage

void main() {
  testWidgets('LoginPage widget test', (WidgetTester tester) async {
    // Build the LoginPage widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
    ));

    // Verify the presence of important widgets:
    expect(find.text('Welcome back 👋'), findsOneWidget);
    expect(find.text('to Attende'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Forgot Password ?'), findsOneWidget);

    // Test the email input field:
    final emailField = find.byType(TextField).first;
    await tester.enterText(emailField, 'test@example.com');
    await tester.pump(); // Trigger a frame to re-render after input.

    // Verify that the email validation icon changes when text is entered.
    expect(find.byIcon(Icons.check_circle), findsOneWidget); // Valid email icon

    // Test invalid email:
    await tester.enterText(emailField, 'invalid-email');
    await tester.pump();

    // Verify that the email validation icon changes to invalid icon.
    expect(find.byIcon(Icons.email_outlined), findsOneWidget); // Invalid email icon

    // Test the password visibility toggle:
    final passwordField = find.byType(TextField).at(1); // The second TextField is for password.
    await tester.enterText(passwordField, 'password123');
    await tester.pump();

    // Tap the visibility icon to toggle password visibility.
    await tester.tap(find.byIcon(Icons.visibility_off_outlined));
    await tester.pump();

    // Verify that the icon changes to "visibility" when clicked.
    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);

    // Test tapping the Login button:
    final loginButton = find.text('Login');
    await tester.tap(loginButton);
    await tester.pump(); // Trigger a frame after the tap.

    // At this point, no action is taken, but you can check if a login function is called,
    // if there was one, or if it navigates somewhere (i.e., using a mock or checking route).
    // For now, we're just verifying the tap action.

    // Test the Forgot Password button:
    final forgotPasswordButton = find.text('Forgot Password ?');
    await tester.tap(forgotPasswordButton);
    await tester.pump();

    // For now, you can assert if the action triggers or if it does something visible.
    // Since there's no action defined, we just verify that the button exists.
    expect(forgotPasswordButton, findsOneWidget);
  });
}
