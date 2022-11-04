// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Widget buildListTileForDrawer(
      BuildContext context, String title, IconData icon, VoidCallback page) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 36,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 23,
          ),
        ),
        onTap: page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Setting the header of the drawer
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'Cooking up!',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontFamily: "Raleway",
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),

          // Below the header of the drawer

          buildListTileForDrawer(
            context,
            'Meal',
            Icons.restaurant_menu,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTileForDrawer(
            context,
            'Filters',
            Icons.filter,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.pageName);
            },
          ),
        ],
      ),
    );
  }
}
