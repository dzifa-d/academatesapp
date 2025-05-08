import 'package:academatesapp/components/dropdown_selector.dart';
import 'package:academatesapp/components/multi_select_chips.dart';
import 'package:flutter/material.dart';
import 'package:academatesapp/components/progress_indicator.dart';
import 'package:academatesapp/components/single_select_chips.dart';
import 'package:academatesapp/components/my_button.dart';
import 'package:academatesapp/screens/complete_profile_screen.dart';

class SetPreferencesScreen extends StatefulWidget {
  const SetPreferencesScreen({super.key});

  @override
  State<SetPreferencesScreen> createState() => _SetPreferencesScreenState();
}

class _SetPreferencesScreenState extends State<SetPreferencesScreen> {
  String? _musicChoice;
  String? _studyMode;
  List<String> _selectedEnvironments = [];
  List<String> _selectedTimes = [];
  String? _studyInteraction;
  String? _groupSize;
  List<String> _studyGoals = [];
  List<String> _studyHabits = [];
  final TextEditingController _otherHabitController = TextEditingController();
  String? _selectedPersonality;

  @override
  Widget build(BuildContext context) {
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
                // Back button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Go back to Create Profile
                  },
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
                    'Set Your Preferences',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 4, 69, 109),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Step Indicator
                StepProgressIndicator(currentStep: 2),

                const SizedBox(height: 30),

                // Personality dropdown
                Text("What is your personality type?", style: labelStyle),
                const SizedBox(height: 8),
                CustomDropdown(
                  hint: "I am an:",
                  items: ['Introvert', 'Extrovert', 'Ambivert'],
                  onChanged:
                      (val) => setState(() => _selectedPersonality = val),
                  selectedItem: _selectedPersonality,
                ),
                const SizedBox(height: 30),

                // Study with or without music
                Text("Do you study with music?", style: labelStyle),
                SingleSelectChips(
                  options: ['With music', 'Without music'],
                  selectedValue: _musicChoice,
                  onSelected: (val) => setState(() => _musicChoice = val),
                ),
                const SizedBox(height: 30),

                // Preferred mode of study
                Text("Preferred mode of study:", style: labelStyle),
                SingleSelectChips(
                  options: ['In-person', 'Online'],
                  selectedValue: _studyMode,
                  onSelected: (val) => setState(() => _studyMode = val),
                ),
                const SizedBox(height: 30),

                // Preferred environment
                Text(
                  "What kind of environment do you prefer?",
                  style: labelStyle,
                ),
                MultiSelectChips(
                  options: [
                    'Outdoors',
                    'Indoors',
                    'At home',
                    'Quiet',
                    'Noisy',
                    'Library',
                    'Cafe',
                  ],
                  selectedValues: _selectedEnvironments,
                  onSelectionChanged:
                      (val) => setState(() => _selectedEnvironments = val),
                ),
                const SizedBox(height: 30),

                // Preferred study times
                Text("Preferred times to study:", style: labelStyle),
                MultiSelectChips(
                  options: ['Morning', 'Afternoon', 'Night', 'Dawn'],
                  selectedValues: _selectedTimes,
                  onSelectionChanged:
                      (val) => setState(() => _selectedTimes = val),
                ),
                const SizedBox(height: 30),

                // Quiet or interactive study
                Text("Quiet or interactive study?", style: labelStyle),
                SingleSelectChips(
                  options: [
                    'Quiet / No interaction',
                    'Some interaction',
                    'Full discussions',
                  ],
                  selectedValue: _studyInteraction,
                  onSelected: (val) => setState(() => _studyInteraction = val),
                ),
                const SizedBox(height: 30),

                // Preferred group size
                Text("Preferred study group size:", style: labelStyle),
                SingleSelectChips(
                  options: ['2-4', '4-6', '7+'],
                  selectedValue: _groupSize,
                  onSelected: (val) => setState(() => _groupSize = val),
                ),
                const SizedBox(height: 30),

                // Study goals
                Text("Study goals:", style: labelStyle),
                MultiSelectChips(
                  options: [
                    'Exam preparation',
                    'Assignment / Project',
                    'Casual study',
                  ],
                  selectedValues: _studyGoals,
                  onSelectionChanged:
                      (val) => setState(() => _studyGoals = val),
                ),
                const SizedBox(height: 30),

                // While studying...
                Text("While studying, I:", style: labelStyle),
                MultiSelectChips(
                  options: [
                    'I sing/hum',
                    'I make hand gestures',
                    'I speak out loud',
                  ],
                  selectedValues: _studyHabits,
                  onSelectionChanged:
                      (val) => setState(() => _studyHabits = val),
                ),
                const SizedBox(height: 15),

                // Other Habits text field
                TextField(
                  controller: _otherHabitController,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Other habits (type here)',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Next Button
                MyButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompleteProfileScreen())
                      );                    // Handle login action here
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )
      );
    }

  // Label Style
  final labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 4, 69, 109),
  );
}
