import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './meal_categories_screen.dart';
import '../other/my_drawer.dart';

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
    // As we will be having two tabs,
    // thats is why we need two widgets here

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
      drawer: const MyDrawer(),
      body: _pages[_selectedIndex]['page'],

      // For showing tabs at the bottom of the screen,
      // Scaffold has built-in property called bottomNavigationBar

      bottomNavigationBar: BottomNavigationBar(
        // What if we press one of the two tabs
        onTap: (value) {
          setState(() {
            // We should change the index
            // so that we can switch tab using index
            _selectedIndex = value;
          });
        },

        // Some styling to the tabs
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        iconSize: 30,
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
