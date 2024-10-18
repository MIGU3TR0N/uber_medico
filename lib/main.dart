import 'package:flutter/material.dart';
import 'package:uber_medico/screens/home_screen.dart';
import 'package:uber_medico/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber Medico',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}