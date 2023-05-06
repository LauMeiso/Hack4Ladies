import 'package:flutter/material.dart';
import 'package:my_first_flutter_website/screens/smartphone_brand_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Color(0xffe2dfd6)
      ),
      home: const SmartphoneListScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
