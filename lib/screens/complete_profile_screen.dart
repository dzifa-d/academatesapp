import 'package:academatesapp/components/my_button.dart';
import 'package:academatesapp/screens/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:academatesapp/components/progress_indicator.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  bool isDescriptionFilled = false;

  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(() {
      setState(() {
        isDescriptionFilled = _descriptionController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 248, 255),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 4, 69, 109),
                    size: 28,
                  ),
                ),
                const SizedBox(height: 12),

                // Title
                Center(
                  child: Text(
                    'Finish Your Profile',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 4, 69, 109),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                StepProgressIndicator(currentStep: 3),
                const SizedBox(height: 40),

                const Text(
                  "Write a short self-description:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 4, 69, 109),
                  ),
                ),
                const SizedBox(height: 5),

                // Text Field
                TextField(
                  controller: _descriptionController,
                  maxLength: 250,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText:
                        "This will tell other Academates a little about who you are...",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Button
                MyButton(
                  text: "Meet Other Academates",
                  isEnabled: isDescriptionFilled,
                  onTap: isDescriptionFilled
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
              ],
            ),
          ),
        ),
      ),

    );
  }
}

