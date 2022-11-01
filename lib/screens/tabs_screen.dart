import 'package:flutter/material.dart';

import '../screens/meal_categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Muhaiman'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                  color: Colors.amber,
                ),
                text: "Categories",
              ),
              Tab(
                icon: Icon(
                  Icons.favorite_sharp,
                  color: Colors.red,
                ),
                text: "Favorites",
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          // Here we will specify screens
          MealCategory(),
          FavoritesScreen(),
        ]),
      ),
    );
  }
}
