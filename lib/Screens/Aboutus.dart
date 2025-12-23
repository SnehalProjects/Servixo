import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: Colors.indigo.shade100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("About Us", style: TextStyle(fontWeight: FontWeight.bold)),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade300, Colors.indigo.shade300],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Icon(Icons.group, size: 100, color: Colors.white.withOpacity(0.4)),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  buildDeveloperProfile(
                    imagePath: 'assets/sarvangi.jpeg', // Sarvangi's photo
                    name: 'Sarvangi Zalavadia',
                    role: 'Flutter Developer | Backend developer',
                    email: 'sarvangi039@gmail.com',
                  ),
                  SizedBox(height: 30),
                  buildDeveloperProfile(
                    imagePath: 'assets/Snehal.jpeg', // Snehal's photo
                    name: 'Snehal Mishra',
                    role: 'Flutter Developer | Backend developer',
                    email: 'snehalmishra003@gmail.com',
                  ),
                  SizedBox(height: 40),
                  Divider(),
                  SizedBox(height: 20),
                  Text(
                    "Servixo is a modern home service app connecting users to service providers with ease and trust. "
                        "Built using Flutter, Firebase, and Dart, our mission is to make services accessible at your fingertips.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Version 1.0.0",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDeveloperProfile({
    required String imagePath,
    required String name,
    required String role,
    required String email,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.shade100.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 15),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple.shade400),
          ),
          SizedBox(height: 8),
          Text(
            role,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, size: 18, color: Colors.purple.shade300),
              SizedBox(width: 5),
              Text(
                email,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
