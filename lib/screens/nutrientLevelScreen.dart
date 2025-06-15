import 'package:flutter/material.dart';

class NutrientLevelScreen extends StatelessWidget {
  final List<String> nutrient_levels_tags;

  NutrientLevelScreen({required this.nutrient_levels_tags});

  // Method to get the color based on the nutrient level
  Color _getNutrientLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'moderate':
        return Colors.yellow;
      case 'low':
        return Colors.greenAccent;
      default:
        return Colors.grey; // default color if level is unknown
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrient Levels'),
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(nutrient_levels_tags.length, (index) {
            // Alternate row colors
            Color? rowColor = index % 2 == 0 ? Colors.white : Colors.grey[300];

            // Extract nutrient and level from the tag
            List<String> parts = nutrient_levels_tags[index].split('-');
            String nutrient = parts.first.split(':').last.replaceAll('-', ' ');
            String level =
                parts[parts.length - 2]; // Level is second-to-last part

            // Get the color based on the nutrient level
            Color iconColor = _getNutrientLevelColor(level);

            return Container(
              color: rowColor,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.circle,
                      color: iconColor), // Icon with dynamic color
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nutrient,
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Level: $level',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
