import 'package:flutter/material.dart';
import 'package:pharmacy_app/screens/home/home_screen.dart';
import 'package:pharmacy_app/screens/welcome_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    final session = await Supabase.instance.client.auth.currentSession;
    if (session != null ) {
      Get.offAll(() => HomeScreen());
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _redirect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeCap: StrokeCap.round,
          strokeWidth: 2.0,
          strokeAlign: 15.0,
          // padding: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
