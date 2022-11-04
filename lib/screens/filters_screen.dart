import 'package:flutter/material.dart';

import '../other/my_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const pageName = '/filters-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("filters"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Text("some filters contents"),
      ),
    );
  }
}
