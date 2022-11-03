import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './meal_categories_screen.dart';

class TabsScreenBottom extends StatefulWidget {
  const TabsScreenBottom({super.key});

  @override
  State<TabsScreenBottom> createState() => _TabsScreenBottomState();
}

class _TabsScreenBottomState extends State<TabsScreenBottom> {
  // We need to control the pages explicitly
  // For that we need the index number of the page we want to control
  int _selectedIndex = 0;

  // Instead of that we also need the list of the pages.
  final List<Map<String, dynamic>> _pages = const [
    {
      "page": MealCategory(),
      "title": "Categories",
    },
    {
      "page": FavoritesScreen(),
      "title": "Favorites",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _pages[_selectedIndex]['page'],

      // This is what we need for the bottom bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        // iconSize: 36,
        type: BottomNavigationBarType.shifting,
        items: const [
          // this property need the BottomNavigationBarItem as element
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
            tooltip: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
            tooltip: "Favorite",
          ),
        ],
      ),
    );
  }
}
