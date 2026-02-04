import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/screens/auth/signin_screen.dart';
import 'package:pharmacy_app/screens/home/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final _isloading = false.obs;
  get isloading => _isloading.value;
  final supabase = Supabase.instance.client;

  Future<void> signUpWithPassword(String email, String password) async {
    _isloading.value = true;

    try {
      final response = await supabase.auth.signUp(
        password: password,
        email: email,
      );
      if (response.user != null) {
        _isloading.value = false;
        Get.showSnackbar(
          const GetSnackBar(
            title: "Sign Up",
            message: 'signUp successful!',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.green,
          ),
        );
        Get.offAll(HomeScreen());
      }
    } catch (error) {
      _isloading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          message: error.toString(),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> signInWithPassword(String email, String password) async {
    _isloading.value = true;

    try {
      final response = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user != null) {
        _isloading.value = false;
        Get.showSnackbar(
          GetSnackBar(
            title: "Sign In",
            message: 'Welcome back!',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.green,
          ),
        );
        Get.offAll(HomeScreen());
      }
    } catch (error) {
      _isloading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          title: "Sign In failed",
          message: error.toString(),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> signOut() async {
    try {
      final response = await supabase.auth.signOut();
      Get.offAll(() => SigninScreen());

    } catch(error) {
      _isloading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          title: "Sign Out failed",
          message: error.toString(),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
