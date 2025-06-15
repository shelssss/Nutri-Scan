import 'package:flutter/material.dart';
import 'package:front_end/bottombar.dart';


class ProductNotFoundScreen extends StatelessWidget {
  const ProductNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "PRODUCT SCANNED DOES NOT EXIST",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
                height: 20), // Add some spacing between the text and the button
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                ); // Go back to the previous screen
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

}