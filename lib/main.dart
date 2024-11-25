// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './screens/add_trip_screen.dart';
import './screens/admin_screen.dart';
import './screens/welcome_screen.dart';
import './app_data.dart';
import './models/trip.dart';
import './screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/trip_detail_screen.dart';
import './screens/category_trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrip = Trips_data;
  List<Trip> _favoritTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrip = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorit(String tripId) {
    final index = _favoritTrips.indexWhere((trip) => trip.id == tripId);

    if (index >= 0) {
      setState(() {
        _favoritTrips.removeAt(index);
      });
    } else {
      setState(() {
        _favoritTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorit(String id) {
    return _favoritTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.amber,
        fontFamily: "Roboto",
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineLarge: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold),
              headlineMedium: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        "/": (ctx) => WelcomeScreen(),
        TabsScreen.mtk: (ctx) => TabsScreen(_favoritTrips),
        CategoryTripsScreen.mTK: (ctx) => CategoryTripsScreen(_availableTrip),
        TripDetailScreen.mtk: (ctx) =>
            TripDetailScreen(_manageFavorit as Function, _isFavorit),
        FilterScreen.mtk: (ctx) =>
            FilterScreen(_filters, _changeFilters as Function),
        AdminScreen.mtk: (ctx) => AdminScreen(),
        AddTripScreen.mtk: (ctx) => AddTripScreen(),
      },
    );
  }
}
