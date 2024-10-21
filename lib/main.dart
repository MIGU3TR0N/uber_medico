import 'package:flutter/material.dart';
import 'package:uber_medico/screens/doctor_data_screen.dart';
import 'package:uber_medico/screens/home_screen.dart';
import 'package:uber_medico/screens/login_screen.dart';
import 'package:uber_medico/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber Medico',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      routes: {
        "/register": (context) => const RegisterScreen(),
        "/docDetails": (context) => const DoctorDataScreen(),
      },
    );
  }
}
