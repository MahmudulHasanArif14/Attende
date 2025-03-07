import 'package:flutter/material.dart';
import 'package:attende/pages/login_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }


  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));  // You might want a shorter delay for testing
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()), // Make sure LoginPage is defined
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width * 0.25;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3C57A4), // Starting color (blue)
                Color(0xFF000000), // Ending color (black)
              ],
            ),
          ),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double textSize = constraints.maxWidth * 0.1; // Responsive text size
                double svgSize = textSize * 0.4; // Responsive SVG size

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Icon(
                      Icons.fingerprint,
                      size: iconSize,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Attende',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CircularProgressIndicator(color: Colors.white),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
