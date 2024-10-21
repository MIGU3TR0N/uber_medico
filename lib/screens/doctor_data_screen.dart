import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DoctorDataScreen extends StatefulWidget {
  const DoctorDataScreen({super.key});

  @override
  State<DoctorDataScreen> createState() => _DoctorDataScreenState();
}

class _DoctorDataScreenState extends State<DoctorDataScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the text fields
  final _especialidadController = TextEditingController();
  final _startHourController = TextEditingController();
  final _finalHourController = TextEditingController();
  final _daysController = TextEditingController();
  String? selectedFile;
  String? selectedFileINE;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1c2120),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        //backgroundColor: Colors.black,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/fondo.png',
              ),
            ),
          ),
        ),
        actions: [
          // right here the selected box
          Container(
            color: const Color.fromARGB(185, 255, 255, 255),
          ),
        ],
        toolbarHeight: 100,
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Car Icon (Use a suitable asset)
                  const Text(
                    'Registro de Medico',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                    ),
                  ), // Replace with your image

                  const SizedBox(height: 20),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Especialidad',
                      border: OutlineInputBorder(),
                    ),
                    controller: _especialidadController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su Especialidad';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Hora de inicio',
                      border: OutlineInputBorder(),
                    ),
                    controller: _startHourController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su Hora de inicio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Hora de fin',
                      border: OutlineInputBorder(),
                    ),
                    controller: _finalHourController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su Hora de fin';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Dias laborales',
                      border: OutlineInputBorder(),
                    ),
                    controller: _daysController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su Dias laborales';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () async {
                      await _pickFile();
                    },
                    child: const Text('Subir cedula profecional',
                        style: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await _pickFileINE();
                    },
                    child: const Text('Subir INE',
                        style: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Perform login logic here
                        print('Login successful!');
                      }
                    },
                    child: const Text(
                      'Crear cuenta',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFile =
            result.files.single.path; // Store the path of the selected file
      });
    }
  }

  Future<void> _pickFileINE() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFileINE =
            result.files.single.path; // Store the path of the selected file
      });
    }
  }
}
