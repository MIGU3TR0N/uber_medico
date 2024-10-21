import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the text fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidoPController = TextEditingController();
  final _apellidoMController = TextEditingController();
  final _domicilioController = TextEditingController();
  final _telefonoController = TextEditingController();
  String? selectedRole = "Paciente";
  int opcion = 0;
  final List<String> roles = ['Paciente', 'Conductor', 'Medico'];
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                hint: const Text('Seleccione el tipo de usuario',
                    style: TextStyle(color: Colors.black)),
                value: selectedRole,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue; // Update the selected role
                    switch (selectedRole) {
                      case 'Conductor':
                        opcion = 1;
                        break;
                      case 'Medico':
                        opcion = 2;
                        break;
                      default:
                        opcion = 0;
                    }
                  });
                },
                items: roles.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(color: Colors.black)),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
        toolbarHeight: 100,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60))),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Car Icon (Use a suitable asset)
                    const Text(
                      'Crear cuenta',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ), // Replace with your image

                    const SizedBox(height: 10),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(),
                      ),
                      controller: _nombreController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su Nombre';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Apellido Paterno',
                        border: OutlineInputBorder(),
                      ),
                      controller: _apellidoPController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su Apellido Paterno';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Apellido Materno',
                        border: OutlineInputBorder(),
                      ),
                      controller: _apellidoMController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su Apellido Materno';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Correo',
                        border: OutlineInputBorder(),
                      ),
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su correo';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Domicilio',
                        border: OutlineInputBorder(),
                      ),
                      controller: _domicilioController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su Domicilio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Telefono',
                        border: OutlineInputBorder(),
                      ),
                      controller: _telefonoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su Telefono';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (opcion == 1) {
                            Navigator.pushNamed(context, "/conDetails");
                          }
                          if (opcion == 2) {
                            Navigator.pushNamed(context, "/docDetails");
                          }
                        }
                      },
                      child: const Text(
                        'Crear',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
