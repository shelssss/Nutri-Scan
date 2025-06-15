import 'package:flutter/material.dart';

class AllergensScreen extends StatelessWidget {
  final List<String> allergens;

  AllergensScreen({required this.allergens});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allergens'),
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(allergens.length, (index) {
            // Alternate row colors
            Color? rowColor = index % 2 == 0 ? Colors.white : Colors.grey[300];

            // Extract allergen name from the format "Allergen: <name>"
            String allergenName = allergens[index].split(':')[1].trim();

            return Container(
              color: rowColor,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.circle,
                      color: Colors.red), // Custom icon for allergens
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      allergenName,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
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
