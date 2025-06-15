import 'package:flutter/material.dart';
import 'package:front_end/screens/AboutUsScreen.dart';
import 'package:front_end/screens/barcodeScannerScreen.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          unselectedLabelColor: Colors.black54,
          indicatorColor: Colors.deepPurpleAccent,
          labelColor: Colors.deepPurpleAccent,
          tabs: [
            Tab(
              icon: Icon(Icons.people),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.document_scanner),
              text: 'Scan',
            ),
            
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            AboutUsPage(),
            BarcodeScannerScreen(),
            
          ],
        ),
      ),
    );
  }
}
