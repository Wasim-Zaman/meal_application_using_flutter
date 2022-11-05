import 'package:flutter/material.dart';

import '../other/my_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const pageName = '/filters-page';

  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("filters"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text("some filters contents"),
      ),
    );
  }
}
