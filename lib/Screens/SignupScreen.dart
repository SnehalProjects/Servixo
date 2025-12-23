import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servixo2/Screens/LoginScreen.dart';
import 'package:servixo2/Screens/HomeScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  // Function to handle signup process
  Future<void> signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create user with email and password
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // If user is created successfully, save their info to Firestore
        if (userCredential.user != null) {
          await FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.uid).set({
            'name': nameController.text,
            'email': emailController.text,
          });

          print("User Registered: ${userCredential.user!.email}");

          // Navigate to the HomeScreen after successful registration
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      } on FirebaseAuthException catch (e) {
        // Handle errors (e.g., email already in use, weak password)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? "Registration Error")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80)),
                child: Image.asset('assets/signup.png', width: MediaQuery.of(context).size.width, height: 300, fit: BoxFit.cover),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 27, horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 6,
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Get Started with Servixo",
                        style: TextStyle(
                          color: Colors.indigo[300],
                          fontFamily: 'DancingScript',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        "Tap. Book. Relax. That’s the Servixo Way!",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                      SizedBox(height: 30),
                      _buildTextField(emailController, "Email", Icons.email, "Enter email..."),
                      _buildTextField(nameController, "Name", Icons.person, "Enter your name..."),
                      _buildTextField(passwordController, "Password", Icons.lock, "Enter password...", isPassword: true),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: signUp, // Call signUp function when button is pressed
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                        child: Text("REGISTER", style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                        child: Text("Already have an account? Login", style: TextStyle(color: Colors.indigo,fontSize: 18),

                      ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable widget for text fields (email, password, name)
  Widget _buildTextField(TextEditingController controller, String label, IconData icon, String hint, {bool isPassword = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? _obscurePassword : false,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) => value!.isEmpty ? 'Enter $label' : null,
      ),
    );
  }
}
