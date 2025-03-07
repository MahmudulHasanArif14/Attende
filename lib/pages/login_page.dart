import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool isEmailValid = false;

  @override
  void initState() {
    super.initState();

    emailTextController.addListener(validateEmail);
  }

  @override
  void dispose() {
    emailTextController.removeListener(validateEmail);
    emailTextController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateEmail() {
    final email = emailTextController.text;
    final bool isValid = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
    setState(() {
      isEmailValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  width: screenHeight * 0.14,
                  height: screenHeight * 0.1,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Text(
                  'Welcome back 👋',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text('to ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Attende',
                        style: TextStyle(fontSize: 24, color: Color(0xFF3085FE), fontWeight: FontWeight.bold)),
                  ],
                ),
                const Text(
                  'Hello there, login to continue',
                  style: TextStyle(fontSize: 12, color: Color(0xFFACAFB5)),
                ),
                const SizedBox(height: 15),

                // Email Field
                TextField(
                  controller: emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(color: Colors.grey.shade600),
                    suffixIcon: Icon(
                      isEmailValid ? Icons.check_circle : Icons.email_outlined,
                      color: isEmailValid ? Colors.green : Colors.grey,
                    ),
                    hintText: "example@email.com",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0x9B3386FE)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0x2A3386FE)
                            : const Color(0x9B3386FE),
                        width: Theme.of(context).brightness == Brightness.dark ? 2 : 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                TextField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey.shade600),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => _obscureText = !_obscureText);
                      },
                      icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0x9B3386FE)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0x2A3386FE)
                            : const Color(0x9B3386FE),
                        width: Theme.of(context).brightness == Brightness.dark ? 2 : 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Forgot Password Button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => kDebugMode ? print("Forgot password") : null,
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: Colors.black,
                    ),
                    child: const Text('Forgot Password ?', style: TextStyle(color: Color(0xFF3085FE))),
                  ),
                ),
                const SizedBox(height: 10),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3085FE),
                      padding: const EdgeInsets.all(15),
                    ),
                    child:  Text('Login',
                      style: TextStyle(
                        color:Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // "Or continue with" Section
                Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double lineWidth = constraints.maxWidth * 0.2;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 1, width: lineWidth, color: const Color(0xFF5B5C5C)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Or continue with social account',
                              style: TextStyle(fontSize: 13, color: Color(0xFF5B5C5C)),
                            ),
                          ),
                          Container(height: 1, width: lineWidth, color: const Color(0xFF5B5C5C)),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Google Login Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      print("Google login");
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            color:  Theme.of(context).brightness == Brightness.dark ? Colors.grey:Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
