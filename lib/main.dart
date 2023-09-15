// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cv_app/view_cv.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CVViewPage(), // Set your home page here
    );
  }
}
