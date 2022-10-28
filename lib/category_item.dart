import 'package:flutter/material.dart';

import './screens/category_recipe_screen.dart';

class CategoryItem extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color color;
  const CategoryItem(this.categoryId, this.categoryTitle, this.color);

  void pageTransition(BuildContext context) {
    /*Named page route*/

    Navigator.of(context).pushNamed(
      CategoryRecipe.screenName,
      arguments: {
        'id': categoryId,
        'title': categoryTitle,
        'color': color,
      },
    );

    /*Material page route*/

    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryRecipe(id: categoryId, title: categoryTitle);
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pageTransition(context);
      },
      splashColor: Theme.of(context).primaryColor,
      canRequestFocus: true,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
