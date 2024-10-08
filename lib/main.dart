import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/category_filter_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryFilterView(),
    );
  }
}
