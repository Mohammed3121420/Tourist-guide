// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism_app/app_data.dart';
import 'dart:io';
import 'package:tourism_app/models/category.dart';
import 'package:tourism_app/models/trip.dart';
import 'package:tourism_app/screens/tabs_screen.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});
  static const mtk = "/add_trip";

  @override
  // ignore: library_private_types_in_public_api
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _activitiesController = TextEditingController();
  final TextEditingController _programController = TextEditingController();

  Category? _selectedCategory;
  File? _image;

  TripType _selectedTripType = TripType.Exploration;
  Season _selectedSeason = Season.Winter;

  bool _isInSummer = false;
  bool _isInWinter = false;
  bool _isForFamilies = false;

  final List<Category> categories = Categories_data;

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  //! إضافة الرحلة إلى Trips_data
  void _saveTrip() {
    if (_formKey.currentState!.validate() && _image != null) {
      final newTrip = Trip(
        id: DateTime.now().toString(),
        categories: [_selectedCategory!.id],
        title: _titleController.text,
        imageUrl: _image!.path,
        activities: _activitiesController.text.split(','),
        program: _programController.text.split(','),
        duration: int.tryParse(_durationController.text) ?? 0,
        season: _selectedSeason,
        tripType: _selectedTripType,
        isInSummer: _isInSummer,
        isInWinter: _isInWinter,
        isForFamilies: _isForFamilies,
      );

      //! طباعة بيانات الرحلة للتأكد من إرسالها
      print('Trip ID: ${newTrip.id}');
      print('Title: ${newTrip.title}');
      print('Duration: ${newTrip.duration}');
      print('Activities: ${newTrip.activities}');
      print('Program: ${newTrip.program}');
      print('Category ID: ${newTrip.categories}');
      print('Image Path: ${newTrip.imageUrl}');
      print('Season: ${newTrip.season}');
      print('Trip Type: ${newTrip.tripType}');
      print('Is in Summer: ${newTrip.isInSummer}');
      print('Is in Winter: ${newTrip.isInWinter}');
      print('Is for Families: ${newTrip.isForFamilies}');
      print(Trips_data);

      setState(() {
        Trips_data.add(newTrip);
      });

      _showSaveDialog(); //! عرض مربع الحوار بعد الحفظ
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and add an image.')),
      );
    }
  }

  //! مربع الحوار بعد الحفظ
  void _showSaveDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Trip Saved Successfully'),
        content: Text('What would you like to do next?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // إغلاق مربع الحوار
              _clearForm(); // تصفير النموذج لإضافة رحلة جديدة
            },
            child: Text('Add Another Trip'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // إغلاق مربع الحوار
              Navigator.of(context).pushNamed(
                TabsScreen.mtk,
                arguments: {
                  'id': _selectedCategory!.id, // تمرير ID التصنيف
                  'title': _selectedCategory!.title, // تمرير عنوان التصنيف
                },
              ); // الانتقال لصفحة أخرى
            },
            child: Text('Go to Trips Page'),
          ),
        ],
      ),
    );
  }

  void _clearForm() {
    setState(() {
      _titleController.clear();
      _durationController.clear();
      _activitiesController.clear();
      _programController.clear();
      _selectedCategory = null;
      _image = null;
      _isInSummer = false;
      _isInWinter = false;
      _isForFamilies = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Trip')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _durationController,
                  decoration: InputDecoration(labelText: 'Duration (days)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter duration';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<Category>(
                  value: _selectedCategory,
                  decoration: InputDecoration(labelText: 'Category'),
                  items: categories
                      .map((category) => DropdownMenuItem<Category>(
                            value: category,
                            child: Row(
                              children: [
                                Image.network(category.imageUrl,
                                    width: 40, height: 40),
                                SizedBox(width: 8),
                                Text(category.title),
                              ],
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<TripType>(
                  value: _selectedTripType,
                  decoration: InputDecoration(labelText: 'Trip Type'),
                  items: TripType.values
                      .map((tripType) => DropdownMenuItem<TripType>(
                            value: tripType,
                            child: Text(tripType.toString().split('.').last),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedTripType = value!;
                    });
                  },
                ),
                DropdownButtonFormField<Season>(
                  value: _selectedSeason,
                  decoration: InputDecoration(labelText: 'Season'),
                  items: Season.values
                      .map((season) => DropdownMenuItem<Season>(
                            value: season,
                            child: Text(season.toString().split('.').last),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSeason = value!;
                    });
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isInSummer,
                      onChanged: (value) {
                        setState(() {
                          _isInSummer = value!;
                        });
                      },
                    ),
                    Text("Is in Summer"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isInWinter,
                      onChanged: (value) {
                        setState(() {
                          _isInWinter = value!;
                        });
                      },
                    ),
                    Text("Is in Winter"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isForFamilies,
                      onChanged: (value) {
                        setState(() {
                          _isForFamilies = value!;
                        });
                      },
                    ),
                    Text("Is for Families"),
                  ],
                ),
                TextFormField(
                  controller: _activitiesController,
                  decoration: InputDecoration(
                      labelText: 'Activities (comma separated)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter activities';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _programController,
                  decoration:
                      InputDecoration(labelText: 'Program (comma separated)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter program';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick Image'),
                ),
                _image != null
                    ? Image.file(_image!)
                    : Text('No image selected'),
                ElevatedButton(
                  onPressed: _saveTrip,
                  child: Text('Save Trip'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
