import 'package:flutter/material.dart';

class CategoryRecipe extends StatelessWidget {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child:
            Text('Recipe of the category whose id = $id would be listed here'),
      ),
    );
  }
}
