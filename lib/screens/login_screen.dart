import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the text fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1c2120),
      appBar: AppBar(
        //backgroundColor: Colors.black,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/fondo.png',
              ),
            ),
          ),
        ),
        toolbarHeight: 250,
        title: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 95,
            width: 95,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/car_icon.png', height: 80,),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(60))
        ),
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
                  Text('Iniciar sesion', textAlign: TextAlign.center, style: TextStyle(fontSize: 38, ),), // Replace with your image
        
                  SizedBox(height: 20),
        
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(),
                    ),
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su correo';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
        
                  TextFormField(
                    decoration: InputDecoration(
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
                  SizedBox(height: 20),
        
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
                    child: Text('Iniciar sesion', style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: Text('¿Olvidaste tu contraseña?'),
                  ),
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}