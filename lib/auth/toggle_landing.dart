import 'package:academatesapp/screens/login_screen.dart';
import 'package:academatesapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class ToggleLanding extends StatefulWidget {
  const ToggleLanding({super.key});

  @override
  State<ToggleLanding> createState() => _ToggleLandingState();
}

class _ToggleLandingState extends State<ToggleLanding> {
  bool showLoginScreen = true;
  
  // Function to toggle between login and signup screens
  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen; // Toggle between login and signup
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(onTap: toggleScreens); // Show login screen
    } else {
      return SignUpScreen(onTap: toggleScreens); // Show signup screen
    }
    
  }
}