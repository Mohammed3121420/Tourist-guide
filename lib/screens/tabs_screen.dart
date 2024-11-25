// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/app_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen(this.favoritTrips);

  static const mtk = "/tabs";

  final List<Trip> favoritTrips;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  int _selectScreenIndex = 0;

  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    _screens = [
      {'Screen': CategoriesScreen(), 'Title': "Trips"},
      {'Screen': FavoritesScreen(widget.favoritTrips), 'Title': 'Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: Text(
            _screens[_selectScreenIndex]['Title'] as String,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.blue,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Trips",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
