import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen(this.favoritTrips);

  final List<Trip> favoritTrips;

  @override
  Widget build(BuildContext context) {
    if (favoritTrips.isEmpty) {
      return Center(
        child: Text("Do not hane favorit Trip"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: favoritTrips[index].id,
            title: favoritTrips[index].title,
            imageUrl: favoritTrips[index].imageUrl,
            duration: favoritTrips[index].duration,
            tripType: favoritTrips[index].tripType,
            season: favoritTrips[index].season,
          );
        },
        itemCount: favoritTrips.length,
      );
    }
  }
}
