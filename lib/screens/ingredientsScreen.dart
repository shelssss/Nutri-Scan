import 'package:flutter/material.dart';

class IngredientsScreen extends StatelessWidget {
  final List<String> ingredientsList;

  IngredientsScreen({required this.ingredientsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(ingredientsList.length, (index) {
            // Alternate row colors
            Color? rowColor = index % 2 == 0 ? Colors.white : Colors.grey[300];

            // Extract allergen name from the format "Allergen: <name>"
            String ingredientName = ingredientsList[index].split(':')[1].trim();

            return Container(
              color: rowColor,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.circle,
                      color: Colors.deepPurpleAccent), // Custom icon for allergens
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      ingredientName,
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
