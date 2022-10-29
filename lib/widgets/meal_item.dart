import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  const MealItem({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        borderOnForeground: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
