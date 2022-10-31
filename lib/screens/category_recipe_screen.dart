import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/dummy_data.dart';

class CategoryRecipe extends StatelessWidget {
  static const screenName = '/category-recipe-screen';

  const CategoryRecipe({super.key});
  /* The below code is for the material page route method */

  // final String id;
  // final String title;
  // const CategoryRecipe({
  //   super.key,
  //   required this.id,
  //   required this.title,
  // });

  @override
  Widget build(BuildContext context) {
    /* Getting the arguments from the named page routes*/
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    final id = args['id'] as String;
    final title = args['title'] as String;

    // Let's create a list of all the elements if it has the available category
    final mealRecipe = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // Creating a meal item
          return MealItem(
            id: mealRecipe[index].id,
            imageUrl: mealRecipe[index].imageUrl,
            affordability: mealRecipe[index].affordability,
            complexity: mealRecipe[index].complexity,
            duration: mealRecipe[index].duration,
            title: mealRecipe[index].title,
          );
        },
        itemCount: mealRecipe.length,
      ),
    );
  }
}
