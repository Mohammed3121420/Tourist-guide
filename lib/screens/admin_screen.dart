// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tourism_app/screens/add_trip_screen.dart';
import 'package:tourism_app/screens/tabs_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  static const mtk = "/admin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Admin Panel')),
        backgroundColor: Colors.blue, 
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white, 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Admin Panel',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors
                      .black, 
                  letterSpacing: 1.2, 
                ),
              ),
              SizedBox(height: 40),

              // إضافة رحلة جديدة
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, 
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), 
                  ),
                  elevation: 8, 
                  shadowColor: Colors.black, 
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AddTripScreen.mtk);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Colors.white), 
                    SizedBox(width: 10),
                    Text(
                      'Add a New Trip',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30), // تباعد بين الأزرار

              // الانتقال إلى صفحة أخرى
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // تغيير لون الزر
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // زاوية مدورة كبيرة
                  ),
                  elevation: 8, // إضافة الظلال
                  shadowColor: Colors.black, // لون الظل
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(TabsScreen.mtk);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.navigate_next,
                        color: Colors.white), // أيقونة الانتقال
                    SizedBox(width: 10),
                    Text(
                      'Go to Trips Page',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
