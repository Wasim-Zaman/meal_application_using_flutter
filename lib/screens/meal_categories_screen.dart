import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class MealCategory extends StatelessWidget {
  const MealCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
        ),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (mealItem) =>
                  CategoryItem(mealItem.id, mealItem.title, mealItem.color),
            )
            .toList(),
      ),
    );
  }
}
