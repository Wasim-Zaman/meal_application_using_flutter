import 'package:flutter/material.dart';

import '../screens/meal_categories_screen.dart';
import '../screens/favorites_screen.dart';

import '../models/meal.dart';

class TabScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  const TabScreen(this.favoriteMeal, {super.key});

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
                  color: Color.fromARGB(255, 3, 3, 3),
                ),
                text: "Favorite",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const MealCategory(),
            FavoritesScreen(favoriteMeal),
          ],
        ),
      ),
    );
  }
}
