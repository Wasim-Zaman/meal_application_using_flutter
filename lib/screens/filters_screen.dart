import 'package:flutter/material.dart';

import '../other/my_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const pageName = '/filters-page';

  final Map<String, bool> filters;
  final Function updateFilters;

  const FiltersScreen(this.filters, this.updateFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree;
  var _isVegan;
  var _isVegetarian;
  var _isLactoseFree;

  @override
  void initState() {
    _isGlutenFree = widget.filters['gluten'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegetarian'];
    _isLactoseFree = widget.filters['lactose'];
    super.initState();
  }

  // create a Switchlistview builder
  Widget _buildSwitchListView(String title, String description,
      bool currentValue, Function updateItem) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: (newValue) => updateItem(newValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("filters"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.updateFilters(selectFilters);
            },
            icon: const Icon(
              Icons.save,
              color: Colors.red,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(23),
            child: const Text(
              "Filter your meal selection",
              softWrap: true,
              style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Cover all the available height
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListView("Gluten Free",
                    "Only shows gluten free meals", _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                _buildSwitchListView(
                    "Lactose Free",
                    "Only shows lactose free meals",
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                _buildSwitchListView(
                    "Vegan", "Only shows vegan meals", _isVegan, (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                _buildSwitchListView(
                    "Vegeterian", "Only shows vegetarian meals", _isVegetarian,
                    (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
