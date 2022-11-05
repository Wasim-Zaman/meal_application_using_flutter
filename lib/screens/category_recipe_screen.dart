import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryRecipe extends StatefulWidget {
  static const screenName = '/category-recipe-screen';
  /* The below code is for the material page route method */

  // final String id;
  // final String title;
  // const CategoryRecipe({
  //   super.key,
  //   required this.id,
  //   required this.title,
  // });

  final List<Meal> availableMeals;
  const CategoryRecipe(this.availableMeals, {super.key});

  @override
  State<CategoryRecipe> createState() => _CategoryRecipeState();
}

class _CategoryRecipeState extends State<CategoryRecipe> {
  String? title;
  // Let's create a list of all the elements if it has the available category
  List<Meal>? displayedMeal;
  var isFirstTime = true;

  @override
  void didChangeDependencies() {
    if (isFirstTime) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

      final id = args['id'] as String;
      title = args['title'] as String;

      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      isFirstTime = false;
    }

    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeal!.removeWhere((meal) {
  //       return meal.id == mealId;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    /* Getting the arguments from the named page routes*/

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // Creating a meal item
          return MealItem(
            id: displayedMeal![index].id,
            imageUrl: displayedMeal![index].imageUrl,
            affordability: displayedMeal![index].affordability,
            complexity: displayedMeal![index].complexity,
            duration: displayedMeal![index].duration,
            title: displayedMeal![index].title,
            // remove item
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeal!.length,
      ),
    );
  }
}
