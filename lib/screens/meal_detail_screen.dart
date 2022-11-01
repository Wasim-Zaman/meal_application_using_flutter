// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const String screenName = '/meal-detail';

  const MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // arguments passed
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    // grab the selected meal item
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == mealId,
    );

    final mediaQuery = MediaQuery.of(context);

    // some reused functions
    Widget buildScrollable(Widget child) {
      return Container(
        height: mediaQuery.size.height * 0.25,
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 50,
          top: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
          ),
        ),
        child: child,
      );
    }

    Widget buildTitleSection(String text) {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(6),
        child: Text(
          text,
          softWrap: true,
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
        selectedMeal.title,
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display the image of the selected meal item.
            Container(
              height: mediaQuery.size.height * 0.3,
              width: double.infinity,
              margin: const EdgeInsets.all(1),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            // Display the section title
            buildTitleSection('Ingredients'),

            // Display the ingredients inside the scrollable box

            buildScrollable(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    selectedMeal.ingredients[index],
                  ),
                ),
                itemCount: 5,
              ),
            ),

            // Display the title section again with new title
            buildTitleSection('Steps'),

            // Display the steps inside the scrollable area
            buildScrollable(
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      child: FittedBox(
                        child: Text(
                          '${index + 1}',
                          softWrap: true,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                    subtitle: const Divider(),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
