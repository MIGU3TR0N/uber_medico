import 'package:flutter/material.dart';
import 'package:flutter_inapp_notifications/flutter_inapp_notifications.dart';
import 'package:uber_medico/screens/agenda_cita_data_screen.dart';
import 'package:uber_medico/screens/conductor_data_screen.dart';
import 'package:uber_medico/screens/doctor_data_screen.dart';
import 'package:uber_medico/screens/home_screen.dart';
import 'package:uber_medico/screens/login_screen.dart';
import 'package:uber_medico/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber Medico',
      debugShowCheckedModeBanner: false,
      builder: InAppNotifications.init(), // Inicializar InAppNotifications aquí
      home: const LoginScreen(),
      routes: {
        "/register": (context) => const RegisterScreen(),
        "/docDetails": (context) => const DoctorDataScreen(),
        "/conDetails": (context) => const ConductorDataScreen(),
        "/agenCitaDetails": (context) => const ScheduleAppointmentScreen(),
      },
    );
  }
}
