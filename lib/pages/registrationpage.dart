import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../widgets/customtext.dart';
import 'login_page.dart';

class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonetextcontroller=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form Key

  bool _isSubmitted = false;

  final TextEditingController confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  bool isEmailValid = false;
  bool validPass=false;
  bool isChecked = false;


  @override
  void initState() {
    super.initState();
    emailTextController.addListener(validateEmail);
    passwordController.addListener(isSamePass);
    confirmPasswordController.addListener(isSamePass);

  }

  @override
  void dispose() {
    emailTextController.removeListener(validateEmail);
    emailTextController.dispose();
    passwordController.dispose();
    firstName.dispose();
    lastName.dispose();
    confirmPasswordController.dispose();
    phonetextcontroller.dispose();
    super.dispose();
  }

  void validateEmail() {
    final email = emailTextController.text;
    final bool isValid = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
    setState(() {
      isEmailValid = isValid;
    });
  }



  void isSamePass(){

    final pass=passwordController.text.toString().trim();
    final confirmPass=confirmPasswordController.text.toString().trim();
    setState(() {
      validPass = pass.isNotEmpty && confirmPass.isNotEmpty && pass == confirmPass;
    });
  }


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        //Change the focus from the keyboard
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  /*Logo*/
                  SizedBox(
                    width: screenHeight * 0.14,
                    height: screenHeight * 0.1,
                    child: Image.asset('assets/images/logo.png'),
                  ),

                  CustomText(text: 'Register Account'),

                  Row(
                    children: const [
                      CustomText(text: 'to '),
                      CustomText(text: 'Attende', color: Color(0xFF3085FE)),
                    ],
                  ),

                  CustomText(
                    text: 'Hello there, register to continue',
                    fontSize: 12,
                    color: Color(0xFFACAFB5),
                  ),

                  const SizedBox(height: 15),


                  // FirstName Field
                  TextFormField(

                    controller: firstName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      hintText: "Enter First Name",
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
                          color:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color(0x2A3386FE)
                              : const Color(0x9B3386FE),
                          width:
                          Theme.of(context).brightness == Brightness.dark
                              ? 2
                              : 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.redAccent.shade100,
                          width: 1,
                        ),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.red.shade400,
                          width: 1,
                        ),
                      ),



                    ),





                    validator: (value) {
                      if (!_isSubmitted) return null;
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },


                    onChanged: (value) {
                      setState(() {
                        _isSubmitted = false;
                        _formKey.currentState!.validate();
                      });
                    },




                  ),


                  const SizedBox(height: 15),

                  // LastName Field
                  TextFormField(


                    controller: lastName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      hintText: "Enter Last Name",
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
                          color:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color(0x2A3386FE)
                              : const Color(0x9B3386FE),
                          width:
                          Theme.of(context).brightness == Brightness.dark
                              ? 2
                              : 1,
                        ),
                      ),


                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.redAccent.shade100,
                          width: 1,
                        ),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.red.shade400,
                          width: 1,
                        ),
                      ),



                    ),




                    validator: (value) {
                      if (!_isSubmitted) return null;
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },


                    onChanged: (value) {
                      setState(() {
                        _isSubmitted = false;
                        _formKey.currentState!.validate();
                      });
                    },





                  ),



                  const SizedBox(height: 15),


                  /*Phone Number */
                  IntlPhoneField(

                    flagsButtonPadding:EdgeInsets.symmetric(horizontal: 10),
                    controller: phonetextcontroller,
                    keyboardType: TextInputType.number,
                    dropdownTextStyle: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    dropdownIconPosition:IconPosition.trailing,

                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      suffixIcon: Icon(
                        isEmailValid ? Icons.check_circle : Icons.local_phone_outlined,
                        color: isEmailValid ? Colors.green : Colors.grey,
                      ),

                      hintText: "Enter Your Number",
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
                          color:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color(0x2A3386FE)
                              : const Color(0x9B3386FE),
                          width:
                          Theme.of(context).brightness == Brightness.dark
                              ? 2
                              : 1,
                        ),
                      ),


                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.redAccent.shade100,
                          width: 1,
                        ),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.red.shade400,
                          width: 1,
                        ),
                      ),




                    ),


                    languageCode: 'en',
                    initialCountryCode: 'BD',


                    validator: (phone) {
                      if (phone == null || phone.number.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },


                   onChanged: (value) {
                      setState(() {
                        _isSubmitted = false;
                        _formKey.currentState!.validate();
                      });
                    },





                  ),





                  const SizedBox(height: 15),

                  // Password Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() => _obscureText = !_obscureText);
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      suffix:(validPass)?Icon(Icons.check_circle_outline,color: Colors.green,):null,


                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0x9B3386FE)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color(0x2A3386FE)
                              : const Color(0x9B3386FE),
                          width:
                          Theme.of(context).brightness == Brightness.dark
                              ? 2
                              : 1,
                        ),
                      ),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.redAccent.shade100,
                          width: 1,
                        ),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.red.shade400,
                          width: 1,
                        ),
                      ),




                    ),


                    validator: (value) {
                      if (!_isSubmitted) return null;
                      if (value == null || value.isEmpty) {
                        return "Password Can't be Empty! ";
                      }
                      return null;
                    },


                    onChanged: (value) {
                      setState(() {
                        _isSubmitted = false;
                        _formKey.currentState!.validate();
                      });
                    },






                  ),



                  const SizedBox(height: 15),


                  // Confirm_Password Field
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      suffixIcon: IconButton(
                        onPressed: () {
                         setState(() {
                            _obscureText=!_obscureText;
                         });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),

                      ),

                      suffix:(validPass)?Icon(Icons.check_circle_outline,color: Colors.green,):null,


                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0x9B3386FE)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color(0x2A3386FE)
                              : const Color(0x9B3386FE),
                          width:
                          Theme.of(context).brightness == Brightness.dark
                              ? 2
                              : 1,
                        ),
                      ),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.redAccent.shade100,
                          width: 1,
                        ),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:Colors.red.shade400,
                          width: 1,
                        ),
                      ),





                    ),



                    validator: (value) {
                      if (!_isSubmitted) return null;
                      if (value == null || value.isEmpty) {
                        return "Password Can't be Empty! ";
                      }
                      return null;
                    },


                    onChanged: (value) {
                      setState(() {
                        _isSubmitted = false;
                        _formKey.currentState!.validate();
                      });
                    },


                  ),




                  const SizedBox(height: 15),



                  // Checkbox with text
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;

                            if(isChecked){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Agreement Accepted"),
                                  duration: Duration(milliseconds: 600),
                                  backgroundColor: Colors.grey.shade200,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.all(15),
                                  padding: EdgeInsets.all(16),
                                  elevation: 6,
                                  dismissDirection: DismissDirection.horizontal,

                                ),
                              );
                            }

                          });
                        },

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        ),
                        side: BorderSide(color: Colors.blue, width: 2),


                      ),
                      Expanded(
                        child: Text("I agree to the Terms & Conditions",
                        style: TextStyle(fontSize: 15),),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),




                  // Registration Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isChecked
                          ? () {


                        setState(() {
                          _isSubmitted = true;
                        });

                        // Add login logic here
                        if (_formKey.currentState!.validate()) {
                          // Perform login
                          final email=emailTextController.text.toString();
                          final pass=passwordController.text.toString();
                          print(email + pass);

                        }


                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3085FE),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: Text('Register', style: TextStyle(color: Colors.white)),
                    ),
                  ),




                  const SizedBox(height: 15),

                  // "Or continue with" Section
                  Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double lineWidth = constraints.maxWidth * 0.2;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: lineWidth,
                              color: const Color(0xFF5B5C5C),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Or continue with social account',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF5B5C5C),
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: lineWidth,
                              color: const Color(0xFF5B5C5C),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Google Login Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // print("Google login");
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
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
                              color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),





                  SizedBox(
                    height: 15,
                  ),

                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFACAFB5),
                          ),
                        ),
                        TextButton(
                          onPressed: () {

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                                  (Route<dynamic> route) => false,
                            );

                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFF3085FE), // Blue color
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),








                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
