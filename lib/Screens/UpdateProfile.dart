import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final _formKey = GlobalKey<FormState>();

  String fullName = "";
  String username = "";
  String dob = "";
  String gender = "";
  String city = "";
  String country = "";
  String phone = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.indigo.shade100,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // <-- This will go back to previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Profile Picture with edit icon
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/HomeScreen/user2.jpg'), // Default image
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Change Profile Picture')),
                            );
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit, color: Colors.purple.shade300, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // Full Name
                buildTextField("Full Name", "Enter your full name", (value) {
                  fullName = value!;
                }),

                SizedBox(height: 20),

                // Username
                buildTextField("Username", "Enter your username", (value) {
                  username = value!;
                }),

                SizedBox(height: 20),

                // Date of Birth
                buildTextField("Date of Birth", "Enter your date of birth", (value) {
                  dob = value!;
                }),

                SizedBox(height: 20),

                // Gender
                buildTextField("Gender", "Enter your gender", (value) {
                  gender = value!;
                }),

                SizedBox(height: 20),

                // City
                buildTextField("City", "Enter your city", (value) {
                  city = value!;
                }),

                SizedBox(height: 20),

                // Country
                buildTextField("Country", "Enter your country", (value) {
                  country = value!;
                }),

                SizedBox(height: 20),

                // Phone Number
                buildTextField("Phone Number", "Enter your phone number", (value) {
                  phone = value!;
                }),

                SizedBox(height: 20),

                // Address
                buildTextField("Address", "Enter your address", (value) {
                  address = value!;
                }, maxLines: 2),

                SizedBox(height: 40),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Profile Updated')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade100,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("Save Changes", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint, Function(String?) onSaved, {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $label";
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
