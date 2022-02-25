import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery Fee App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(title: 'Delivery Fee Calculator'),
    );
  }
}
