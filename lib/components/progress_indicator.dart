import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;

  const StepProgressIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStepCircle(1, isActive: currentStep >= 1),
          _buildStepLine(),
          _buildStepCircle(2, isActive: currentStep >= 2),
          _buildStepLine(),
          _buildStepCircle(3, isActive: currentStep >= 3),
        ],
      ),
    );
  }

 Widget _buildStepCircle(int step, {required bool isActive}) {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isActive ? const Color.fromARGB(255, 182, 105, 5) : Colors.grey[300],
    ),
    alignment: Alignment.center,
    child: Text(
      '$step',
      style: TextStyle(
        color: isActive ? Colors.white : const Color.fromARGB(255, 65, 78, 76),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ),
  );
}

Widget _buildStepLine() {
  return Expanded(
    child: Container(
      height: 2,
      color: Colors.grey[400],
    ),
  );
}}