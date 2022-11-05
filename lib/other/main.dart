import 'package:flutter/material.dart';

import '../screens/category_recipe_screen.dart';
import '../screens/meal_categories_screen.dart';
import '../screens/tabs_screen_bottom.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/filters_screen.dart';
import '../themes/theme_data.dart';

import '../models/dummy_data.dart';
import '../models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;

  void _updateFilters(Map<String, bool> filteredMeal) {
    setState(() {
      _filter = filteredMeal;
    });

    // here we will set the available meals
    _availableMeal = DUMMY_MEALS.where((meal) {
      if (_filter['gluten'] == true && !meal.isGlutenFree) {
        return false;
      }
      if (_filter['lactose'] == true && !meal.isLactoseFree) {
        return false;
      }
      if (_filter['vegan'] == true && !meal.isVegan) {
        return false;
      }
      if (_filter['vegetarian'] == true && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meal App",
      theme: themeData(),
      // home: const MealCategory(),
      initialRoute: "/",
      routes: {
        '/': (context) => const TabsScreenBottom(),
        CategoryRecipe.screenName: (context) => CategoryRecipe(_availableMeal),
        MealDetail.screenName: (context) => const MealDetail(),
        FiltersScreen.pageName: (context) =>
            FiltersScreen(_filter, _updateFilters),
      },
      onGenerateRoute: (settings) {
        return null;

        // if (settings.name == '/'){

        // }
        // else if (settings.name == '/abc'){

        // }
      },

      // If we enter to an unknwon screen, then we should handle that case
      onUnknownRoute: (settings) {
        // We user encounters unknown page,
        // He should be redirected to Meal Category page
        return MaterialPageRoute(
          builder: (context) => const MealCategory(),
        );
      },
    );
  }
}
