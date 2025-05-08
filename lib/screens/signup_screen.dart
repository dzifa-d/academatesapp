import 'package:academatesapp/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:academatesapp/screens/set_preferences_screen.dart';
import 'package:academatesapp/components/progress_indicator.dart';

class SignUpScreen extends StatefulWidget {
  final void Function() onTap;

  const SignUpScreen({super.key, required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  String? _selectedGender;
  bool isFormValid = false;

  void _validateForm() {
    setState(() {
      isFormValid =
          _nameController.text.trim().isNotEmpty &&
          _emailController.text.trim().isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _ageController.text.trim().isNotEmpty &&
          _cityController.text.trim().isNotEmpty &&
          _selectedGender != null;
    });
  }

  @override
  void initState() {
    super.initState();

    _nameController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _ageController.addListener(_validateForm);
    _cityController.addListener(_validateForm);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String dropdownValue = 'Select Gender';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 248, 255),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: Text(
                    'Create Your Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 4, 69, 109),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                
                // Step Indicator
                StepProgressIndicator(currentStep: 1),
                SizedBox(height: 20),

                // Name
                _buildTextField(hint: 'Full Name', controller: _nameController),
                SizedBox(height: 15),

                // Email
                _buildTextField(hint: 'Email', controller: _emailController),
                SizedBox(height: 15),

                // Password
                _buildTextField(hint: 'Password', obscure: true, controller: _passwordController),
                SizedBox(height: 15),

                // Gender Dropdown
                _buildDropdownField(),
                SizedBox(height: 15),

                // Age
                _buildTextField(hint: 'Age', keyboardType: TextInputType.number, controller: _ageController),
                SizedBox(height: 15),

                // City
                _buildTextField(hint: 'City', controller: _cityController),
                SizedBox(height: 30),

                // Next Button
                MyButton(
                  text: 'Next',
                  isEnabled: isFormValid,
                  onTap: isFormValid
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetPreferencesScreen(),
                            ),
                          );
                        }
                      : null,
                ),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 2, 4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        ' Sign in', 
                        style: TextStyle(color: const Color.fromARGB(255, 7, 83, 145),
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ],
                ),
                    
                SizedBox(height: 17), // Space between password and login button

                // Terms and Conditions
                Center(
                  child: Text(
                    'By signing up, you agree to our Terms & Conditions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 0, 2, 4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      )
    );
  }

  Widget _buildTextField({required String hint, required TextEditingController controller, bool obscure = false, TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }


  Widget _buildDropdownField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        hint: Text('Gender'),
        items: ['Male', 'Female', 'Other'].map((gender) {
          return DropdownMenuItem<String>(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedGender = value;
          });
        },
      ),
    );
    
  }
}
