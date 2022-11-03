import 'package:flutter/material.dart';

import '../screens/meal_categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Meal App",
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category, color: Colors.amber),
                text: "Category",
              ),
              Tab(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                text: "Favorite",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MealCategory(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
