import 'package:flutter/material.dart';

class ScheduleAppointmentScreen extends StatefulWidget {
  const ScheduleAppointmentScreen({super.key});

  @override
  State<ScheduleAppointmentScreen> createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  // Lista de doctores y sus imágenes
  final List<Map<String, String>> _doctors = [
    {"name": "Dr. Juan Pérez", "image": "assets/doctora.png"},
    {"name": "Dra. Ana García", "image": "assets/doctora.png"},
    {"name": "Dr. Carlos Hernández", "image": "assets/doctora.png"},
    {"name": "Dra. María López", "image": "assets/doctora.png"},
  ];

  String? _selectedDoctor;
  String? _selectedDoctorImage;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  OverlayEntry? _notificationOverlay;

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _showCustomNotification() {
    // Generar el mensaje basado en el doctor, la fecha y la hora seleccionada
    final doctor = _selectedDoctor ?? "Doctor no seleccionado";
    final date = _selectedDate != null
        ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
        : "Fecha no seleccionada";
    final time = _selectedTime != null
        ? "${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')} hrs"
        : "Hora no seleccionada";

    _notificationOverlay = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        left: 20,
        right: 20,
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'NOTIFICACION',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () {
                        _hideNotification();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '¡Buenos Días!\n\nEl día de tu cita es el $date a las $time, en el Sanatorio Jesús de Nazareth con el $doctor.',
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("Cita aceptada");
                        _hideNotification();
                      },
                      child: const Text(
                        "ACEPTAR",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print("Cita rechazada");
                        _hideNotification();
                      },
                      child: const Text(
                        "RECHAZAR",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(_notificationOverlay!);
  }

  void _hideNotification() {
    _notificationOverlay?.remove();
    _notificationOverlay = null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _timeController.text =
            "${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda una cita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Dropdown para seleccionar el doctor con imagen
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Selecciona un doctor',
                  border: OutlineInputBorder(),
                ),
                value: _selectedDoctor,
                items: _doctors.map((doctor) {
                  return DropdownMenuItem<String>(
                    value: doctor["name"],
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(doctor["image"]!),
                          radius: 15,
                        ),
                        const SizedBox(width: 10),
                        Text(doctor["name"]!),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDoctor = value;
                    _selectedDoctorImage = _doctors.firstWhere(
                        (doctor) => doctor["name"] == value)["image"];
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona un doctor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Campo de selección de fecha
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Selecciona la fecha',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona una fecha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Campo de selección de hora
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(
                  labelText: 'Selecciona la hora',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () {
                  _selectTime(context);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona una hora';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Botón para agendar cita
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Mostrar notificación personalizada con datos del doctor y la fecha seleccionados
                    _showCustomNotification();
                  }
                },
                child: const Text('Agendar Cita'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
