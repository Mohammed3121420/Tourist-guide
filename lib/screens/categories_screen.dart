// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      // gridDelegate هذي القيمه ضروريه عشان نسوي gridview
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // نستخدم ذا الكلاس عشان اعطي و احدد  كل تصنيف
        maxCrossAxisExtent: 200,
        // كذا احدد كم عامود راح يظهر في الشاشه يعتمد على حجم الشاشه
        //اذا كانت الشاشه 100 راح يظهر عامود واحد و ائا كان 500 راح يظهر عامودين
        childAspectRatio: 7 / 8,
        // نسبه و تناسب عشان نحدد العرض و الارتفاع 8 يدل على الارتفاع
        mainAxisSpacing: 10,
        // يعطي مساحات على شكل افقي
        crossAxisSpacing: 10,
        // يعطي مساحات على شكل عامودي
      ),
      children: Categories_data.map(
        (CategoryData) => CategoryItem(
          CategoryData.id,
          CategoryData.title,
          CategoryData.imageUrl,
        ),
      ).toList(),
    );
  }
}
