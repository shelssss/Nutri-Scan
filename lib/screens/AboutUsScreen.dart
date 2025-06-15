import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutri-Scan'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurpleAccent, // Removes the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Nutri Scan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Nutri Scan is your go-to app for scanning barcodes and fetching detailed product information from the Open Food Facts database. Our mission is to provide you with accurate and comprehensive nutritional information to help you make informed food choices.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Using the power of Open Food Facts API, Nutri Scan allows you to quickly scan and retrieve data about various food products, ensuring that you always know what you\'re consuming.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Thank you for choosing Nutri Scan. Your health and nutrition are our top priorities.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
             
            ],
          ),
        ),
      ),
    );
  }
}