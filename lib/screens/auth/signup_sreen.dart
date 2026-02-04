import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/controllers/auth_controller.dart';
import 'package:pharmacy_app/screens/auth/signin_screen.dart';
import 'package:get/get.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  bool _showPass = true;
  bool isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(backgroundColor: Colors.blue.shade50),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
            MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).padding.top,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.blue.shade600,
                      ),
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return 'Please Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.blue.shade600,
                      ),
                      hintText: 'Full name',
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _showPass,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.blue.shade600,
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPass = !_showPass;
                          });
                        },
                        icon: Icon(
                          _showPass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 8) {
                        return 'password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: confirmController,
                    obscureText: _showPass,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.blue.shade600,
                      ),
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPass = !_showPass;
                          });
                        },
                        icon: Icon(
                          _showPass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter confirm password';
                      }
                      if (value != passwordController.text) {
                        return 'passwords must much';
                      }
                      return null;
                    },
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.blue.shade600,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'I have read and agreed to ',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: 'User Agreement Privacy Policy',
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                // recognizer: TapGestureRecognizer()
                                //   ..onTap = () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) {
                                //           return SigninScreen();
                                //         },
                                //       ),
                                //     );
                                //   },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    return FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50.0),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        } else {
                          _authController.signUpWithPassword(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      child: _authController.isloading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.grey),
                      ),
                      Text("Or"),
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 40,
                    children: [
                      Image.asset('assets/images/google.png', width: 30),
                      Image.asset('assets/images/facebook.png', width: 35),
                      Image.asset('assets/images/x.png', width: 30),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Joined us before? ',
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'SignIn',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SigninScreen();
                                  },
                                ),
                              );
                            },
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
