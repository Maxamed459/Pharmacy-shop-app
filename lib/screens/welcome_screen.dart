import 'package:flutter/material.dart';
import 'package:pharmacy_app/screens/auth/signin_screen.dart';
import 'package:pharmacy_app/screens/auth/signup_sreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Image.asset('assets/images/doctor.png'),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 210,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                spacing: 15,
                children: [
                  FittedBox(
                    child: Text(
                      "WE ARE HERE TO HELP",
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SingupScreen()),
                      );
                    },
                    child: Text("Get Started"),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ), // Rounded corners
                      ),
                      side: BorderSide(color: Colors.blue.shade600),
                      minimumSize: Size(double.infinity, 50.0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SigninScreen()),
                      );
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.blue.shade600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
