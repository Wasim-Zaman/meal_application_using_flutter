import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const String screenName = '/meal-detail';

  const MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // arguments passed
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(mealId)),
      body: Center(
        child: Text(mealId),
      ),
    );
  }
}
