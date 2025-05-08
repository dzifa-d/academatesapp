 import 'package:flutter/material.dart';

class MultiSelectChips extends StatelessWidget {
  final List<String> options;
  final List<String> selectedValues;
  final void Function(List<String>) onSelectionChanged;

  const MultiSelectChips({
    super.key,
    required this.options,
    required this.selectedValues,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children:
          options.map((option) {
            final isSelected = selectedValues.contains(option);
            return FilterChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (bool selected) {
                final updated = List<String>.from(selectedValues);
                selected ? updated.add(option) : updated.remove(option);
                onSelectionChanged(updated);
              },
              selectedColor: const Color.fromARGB(255, 139, 89, 4),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey.shade400),
              ),
            );
          }).toList(),
    );
  }
}