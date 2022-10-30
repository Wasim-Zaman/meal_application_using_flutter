import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const TextIcon({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.pink,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.010,
        ),
        Text(text),
      ],
    );
  }
}
