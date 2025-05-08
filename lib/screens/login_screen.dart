import 'package:academatesapp/screens/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:academatesapp/components/my_button.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;

  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isFormValid = false;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      isFormValid = 
      _emailController.text.trim().isNotEmpty &&
      _passwordController.text.isNotEmpty;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 248, 255),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(height: 50), // Space at the top

                //Academates Logo
                Text(
                "Academates",
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 40, 
                  color: Color.fromARGB(255, 4, 69, 109)
                  ),
                ),
                SizedBox(height: 50), // Space between logo and text

                //email text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
            
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Space between email and password text field

                //password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                      controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space between password and login button

                //login button
                MyButton(
                  text: 'Sign in',
                  isEnabled: isFormValid,
                  onTap: isFormValid
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiscoverScreen(),
                            ),
                          );
                        }
                      : null,
                ),
                SizedBox(height: 20), // Space between password and login button


                //New to the app? Create a new profile
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: const Color.fromARGB(255, 0, 2, 4),
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        ' Sign up', 
                        style: TextStyle(color: const Color.fromARGB(255, 7, 83, 145),
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    )
                    
                  ],
                ),
              ],
            ),
          )
        ),
      ),
      ),
    );
  }
}