import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../widgets/icon_plus_text.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  const MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.affordability,
    required this.complexity,
    required this.duration,
  });

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";

      case Affordability.Luxurious:
        return "Luxurious";

      case Affordability.Pricey:
        return 'Pricey';

      default:
        return "Unknown";
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";

      case Complexity.Hard:
        return "Hard";

      case Complexity.Simple:
        return "Simple";

      default:
        return "Unknown";
    }
  }

  // meal detail screen navigator

  void choosedMealNavigator(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetail.screenName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => choosedMealNavigator(context),
      child: Card(
        // borderOnForeground: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(13),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),

                // Display some text on the image
                Positioned(
                  width: 300,
                  left: 50,
                  bottom: 10,
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    color: Colors.black54,
                    child: Text(
                      softWrap: true,
                      title,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextIcon(icon: Icons.schedule, text: '$duration min'),
                  TextIcon(icon: Icons.work, text: complexityText),
                  TextIcon(icon: Icons.attach_money, text: affordabilityText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
