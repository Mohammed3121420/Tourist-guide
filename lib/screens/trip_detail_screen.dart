// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors,

import 'dart:io';

import 'package:flutter/material.dart';
import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const mtk = '/trip-detail';

  final Function manageFavorit;
  final Function isFavorit;

  TripDetailScreen(this.manageFavorit, this.isFavorit);

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  Widget buildListView(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            selectedTrip.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: selectedTrip.imageUrl.startsWith('http')
                  ? Image.network(
                      selectedTrip.imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(selectedTrip.imageUrl),
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 10),
            buildSectionTitle(context, "Activities"),
            buildListView(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            buildSectionTitle(context, "Daily schedule"),
            buildListView(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("Day${index + 1}"),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorit(tripId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => manageFavorit(tripId),
      ),
    );
  }
}
