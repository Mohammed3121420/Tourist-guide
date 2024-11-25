// ignore_for_file: unnecessary_import, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:tourism_app/app_data.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const mTK = "/category-trips";

  final List<Trip> availableTrip;

  CategoryTripsScreen(this.availableTrip);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late String categoryId;
  late List<Trip> displayTrip = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryId = routeArgs["id"]!;
    categoryTitle = routeArgs["title"]!;

    _updateDisplayTrips(); // تصفية الرحلات عند بناء الصفحة
  }

  void _updateDisplayTrips() {
    setState(() {
      displayTrip = widget.availableTrip.where((trip) {
        return trip.categories
            .contains(categoryId); // تصفية الرحلات حسب التصنيف
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            categoryTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: displayTrip.isEmpty
          ? Center(
              child: Text(
                'No trips found in this category!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: displayTrip.length,
              itemBuilder: (ctx, index) {
                return TripItem(
                  id: displayTrip[index].id,
                  title: displayTrip[index].title,
                  imageUrl: displayTrip[index].imageUrl,
                  duration: displayTrip[index].duration,
                  tripType: displayTrip[index].tripType,
                  season: displayTrip[index].season,
                );
              },
            ),
    );
  }

  @override
  void didUpdateWidget(covariant CategoryTripsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.availableTrip != widget.availableTrip) {
      _updateDisplayTrips();
    }
  }
}
