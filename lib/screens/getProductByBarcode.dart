import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> getProductByBarcode(String barcode) async {
  try {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5299/api/Products/$barcode'));

    if (response.statusCode == 200) {
      // Parse JSON response
      var productData = jsonDecode(response.body);

      // Handle product data here (e.g., display in UI)
      print(productData);
    } else {
      // Handle error (e.g., display error message)
      print('Failed to load product data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network or other errors
    print('Error retrieving product data: $e');
  }
}
