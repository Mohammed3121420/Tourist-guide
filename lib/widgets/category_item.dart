// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryItem(
    this.id,
    this.title,
    this.imageUrl,
  );

  void selectCategory(BuildContext ctx) {
    // Navigator يساعدنا في التنقل بين الصفحات
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.mTK, arguments: {
      "id": id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    //inmation
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4), //شفافيه
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          )
        ],
      ),
    );
  }
}
