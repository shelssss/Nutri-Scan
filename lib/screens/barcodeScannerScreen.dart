import 'package:flutter/material.dart';
import 'package:front_end/screens/noProductScreen.dart';
import 'package:front_end/screens/productDetailScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  bool isLoading = false; // State variable to track loading state
  String API_URL = dotenv.env['API_URL'] ?? '';
  Future<void> scanBarcodeAndFetchProduct(BuildContext context) async {
    setState(() {
      isLoading = true; // Set loading state to true while fetching data
    });

    try {
      // Scan the barcode
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Color for the scan overlay
        "Cancel", // Text for the cancel button
        false, // Whether to show the flash icon
        ScanMode.DEFAULT, // Scan mode (you can use QR_CODE or DEFAULT)
      );

      // Check if the barcode scan was successful
      if (barcode != '-1') {
        // Fetch product data using the scanned barcode
        var headers = {
          'User-Agent': 'apiPracticeApp/1.0', // Custom User-Agent header
        };
        var response = await http.get(
          Uri.parse('$API_URL/$barcode'),
          headers: headers,
        );

        if (response.statusCode == 200) {
          var productData = jsonDecode(response.body);
          String productName = productData['product']['product_name_en'];
          String imageURL = productData['product']['image_url'];
          String nutriScore = productData['product']['nutriscore_grade'];
          String novaScore = productData['product']['nova_groups'];
          String ecoScore = productData['product']['ecoscore_grade'];
          List<String> allergens =
              List<String>.from(productData['product']['allergens_tags'] ?? []);
          List<String> ingredients =
              List<String>.from(productData['product']['ingredients_tags'] ?? []);
          List<String> nutrientLevels = List<String>.from(
              productData['product']['nutrient_levels_tags'] ?? []);
          // Navigate to product details screen with product name
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                productName: productName,
                imageURL: imageURL,
                nutriScore: nutriScore,
                novaScore: novaScore,
                ecoScore: ecoScore,
                allergens: allergens,
                ingredients: ingredients,
                nutrientLevels: nutrientLevels,
              ),
            ),
          );
        } else {
          // Handle error (e.g., show error message)
          print('Failed to load product data: ${response.statusCode}');
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductNotFoundScreen(),
        ),
      );
        }
      } else {
        // Barcode scanning was cancelled or failed
        print('Barcode scan was cancelled or failed');
      }
    } catch (e) {
      // Handle error (e.g., show error message)
      print('Error: $e');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductNotFoundScreen(),
        ),
      );
    } finally {
      setState(() {
        isLoading = false; // Set loading state to false after fetching data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutri-Scan'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(
               valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
            ) // Show loading indicator while fetching data
            : ElevatedButton(
                style:  ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                             ),
                onPressed: () => scanBarcodeAndFetchProduct(context),
                child: const Icon(Icons.document_scanner_outlined),
              ),
      ),
    );
  }
}
