import 'package:flutter/material.dart';
import 'package:front_end/screens/allergenScreen.dart';
import 'package:front_end/screens/ingredientsScreen.dart';
import 'package:front_end/screens/nutrientLevelScreen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productName;
  final String imageURL;
  final String nutriScore;
  final String novaScore;
  final String ecoScore;
  final List<String> allergens;
  final List<String> ingredients;
  final List<String> nutrientLevels;

  ProductDetailsScreen(
      {required this.productName,
      required this.imageURL,
      required this.nutriScore,
      required this.novaScore,
      required this.allergens,
      required this.ingredients,
      required this.ecoScore,
      required this.nutrientLevels});

  @override
  Widget build(BuildContext context) {
    // Function to get the icon image for the nutriScore
    String getNutriScoreImagePath(String nutriScore) {
      // Define the folder path where nutriScore icons are stored (assuming 'images' folder)
      String basePath = 'images';

      // Map nutriScore to corresponding icon filename
      switch (nutriScore.toLowerCase()) {
        case 'a':
          return '$basePath/a.PNG';
        case 'b':
          return '$basePath/b.PNG';
        case 'c':
          return '$basePath/c.PNG';
        case 'd':
          return '$basePath/d.PNG';
        case 'e':
          return '$basePath/e.PNG';
        default:
          return '$basePath/no.PNG'; // Return empty string if invalid nutriScore
      }
    }

    //Get Nova Score
    String getNovaScoreImagePath(String novaScore) {
      // Define the folder path where nutriScore icons are stored (assuming 'images' folder)
      String basePath = 'images';

      // Map nutriScore to corresponding icon filename
      switch (novaScore) {
        case '1':
          return '$basePath/1.PNG';
        case '2':
          return '$basePath/2.PNG';
        case '3':
          return '$basePath/3.PNG';
        case '4':
          return '$basePath/4.PNG';
        default:
          return '$basePath/z.PNG';
      }
    }

    // getEco Score
    String getEcoScoreImagePath(String ecoScore) {
      // Define the folder path where ecoScore icons are stored (assuming 'images' folder)
      String basePath = 'images';

      // Map nutriScore to corresponding icon filename
      switch (ecoScore.toLowerCase()) {
        case 'a':
          return '$basePath/eA.PNG';
        case 'b':
          return '$basePath/eB.PNG';
        case 'c':
          return '$basePath/ec.PNG';
        case 'd':
          return '$basePath/ed.PNG';
        case 'e':
          return '$basePath/ee.PNG';
        default:
          return '$basePath/noE.PNG';
      }
    }

    String getNovaLabel(String novaScore) {
      switch (novaScore) {
        case '1':
          return 'Unprocessed or minimally\nprocessed foods';
        case '2':
          return 'Processed culinary ingredients';
        case '3':
          return 'Processed foods';
        case '4':
          return 'Ultra-processed foods';
        default:
          return 'Processed Quality Unknown';
      }
    }

    String getNutriScoreLabel(String nutriScore) {
      switch (nutriScore.toLowerCase()) {
        case 'a':
          return 'Good Nutrition Quality';
        case 'b':
          return 'Fair Nutrition Quality';
        case 'c':
          return 'Moderate Nutrition Quality';
        case 'd':
          return 'Poor Nutrition Quality';
        case 'e':
          return 'Bad Nutrition Quality';
        default:
          return 'Nutrition Quality Unknown';
      }
    }

    String getEcoScoreLabel(String ecoScore) {
      switch (ecoScore.toLowerCase()) {
        case 'a':
          return 'Very Low Environmental\nimpact';
        case 'b':
          return 'Relatively Low Environmental\nimpact';
        case 'c':
          return 'Moderate Environmental\n impact';
        case 'd':
          return 'High Environmental\nimpact';
        case 'e':
          return 'Very High Environmental\nimpact';
        default:
          return 'Unknown Environmental\nimpact';
      }
    }

    void onViewAllergens(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllergensScreen(allergens: allergens),
        ),
      );
    }

    void onViewIngredients(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IngredientsScreen(ingredientsList: ingredients),
        ),
      );
    }

    // Get the path for the icons
    String nutriScoreIconPath = getNutriScoreImagePath(nutriScore);
    String novaScoreIconPath = getNovaScoreImagePath(novaScore);
    String getEcoScoreIconPath = getEcoScoreImagePath(ecoScore);
    // Get labels
    String novaLabel = getNovaLabel(novaScore);
    String nutriScoreLabel = getNutriScoreLabel(nutriScore);
    String ecoScoreLabel = getEcoScoreLabel(ecoScore);

    //UI
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageURL.isNotEmpty
                      ? Image.network(
                          imageURL,
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            // Print the error message to the console
                            print('Error loading image: $error');

                            // Return a fallback UI when image loading fails
                            return Container(
                              width: 200,
                              height: 200,
                              color: Colors.grey[300],
                              child: Center(
                                child: Text(
                                  'Failed to load image',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          },
                        )
                      : Container(
                          width: 200,
                          height: 200,
                          color: Colors.grey[300],
                          child: Center(
                            child: Text(
                              'No Image Available',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                  const SizedBox(height: 8),
                  Text(
                    productName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 8),
                      // Display nutriScore icon below the text
                      Row(
                        children: [
                          const SizedBox(height: 8),
                          Image.asset(
                            nutriScoreIconPath,
                            width: 130,
                            height: 130,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              nutriScoreLabel,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 8),
                      //
                      Row(
                        children: [
                          const SizedBox(height: 8),
                          Image.asset(
                            getEcoScoreIconPath,
                            width: 130,
                            height: 130,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              ecoScoreLabel,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 8),
                      // Display nutriScore icon below the text
                      Row(
                        children: [
                          const SizedBox(height: 8),
                          Image.asset(
                            novaScoreIconPath,
                            width: 130,
                            height: 130,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            novaLabel,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllergensScreen(allergens: allergens),
                        ),
                      );
                    },
                    child: const Card(
                      elevation: 4,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.warning_amber,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Allergens',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              IngredientsScreen(ingredientsList: ingredients),
                        ),
                      );
                    },
                    child: const Card(
                      elevation: 4,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.list, color: Colors.black),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Ingredients',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NutrientLevelScreen(
                              nutrient_levels_tags: nutrientLevels),
                        ),
                      );
                    },
                    child: const Card(
                      elevation: 4,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.leaderboard, color: Colors.black),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Nutrients Level',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
