import 'package:flutter/material.dart';
import 'package:formdemo/screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const FormScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
