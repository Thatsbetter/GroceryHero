import 'package:flutter/material.dart';
import 'package:grocery_hero/Screens/MapScreen.dart';
import 'package:grocery_hero/Screens/ProductDetails.dart';
import 'package:grocery_hero/Screens/SelectSupermarketWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MapScreen(),
    SelectSupermarketWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Set app bar to null to remove it
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'Buy',
          ),
          // Add more BottomNavigationBarItems for additional screens
        ],
      ),
    );
  }
}