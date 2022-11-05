import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoritesScreen(this.favoriteMeal, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text("No Favorite Meals Selected yet"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          // Creating a meal item
          return MealItem(
            id: favoriteMeal[index].id,
            imageUrl: favoriteMeal[index].imageUrl,
            affordability: favoriteMeal[index].affordability,
            complexity: favoriteMeal[index].complexity,
            duration: favoriteMeal[index].duration,
            title: favoriteMeal[index].title,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
