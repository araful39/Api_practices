
import 'package:api_practice/part-02/view/home_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

// whenever your initialization is completed, remove the splash screen:

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: MyHomePage(title: 'Demo',),
    );
  }
}
