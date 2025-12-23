import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:servixo2/Screens/ProfileScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'LoginScreen.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: ProfileDetailPage(),
//   ));
// }

class ProfileDetailPage extends StatefulWidget {

  String name,cost,rating,image,about;


  ProfileDetailPage({required this.name, required this.cost, required this.rating,required this.image, required this.about});
  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState(name: name, cost: cost, rating: rating,image: image, about: about);

}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  String name,rating,cost,image,about;
  _ProfileDetailPageState({required this.name, required this.cost, required this.rating, required this.image, required this.about});
  bool isSaved = false; // Bookmark state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade50,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              // Profile Image with Overlay Card
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isSaved = !isSaved; // Toggle bookmark state
                        });
                      },
                    ),
                  ),
                  // Positioned(
                  //   // top: 40,
                  //   left: 10,
                  //   child: IconButton(
                  //     icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
                  //     onPressed: () {
                  //       Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => ProfileScreen()),
                  //       );
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 260, left: 15, right: 15),
                    child: Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                                    SizedBox(width: 4),
                                    Text(
                                      "Location",
                                      style: TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  cost,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, size: 16, color: Colors.orange),
                                    Text("4.5", style: TextStyle(fontSize: 14, color: Colors.black)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // About Me Section
              Text(
                "About Me",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                widget.about,
                // "Plumber repairing services ensure efficient, reliable fixes for all plumbing issues, providing quick solutions to keep your systems running smoothly.",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),

              SizedBox(height: 16),

              // Review from Client
              Text(
                "Review from client",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(5, (index) => Icon(Icons.star, color: Colors.orange, size: 20)),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "This is What I was looking for!",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "David Backham - May 09, 2024",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "This is the first time I'm using this service. The work was very clean - Highly recommended.",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // Pricing and Book Now Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      cost,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                  onPressed: () {
                  Fluttertoast.showToast(
                  msg: "You have booked service provider",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.indigo[300],
                  textColor: Colors.white,
                  fontSize: 16.0,
                  );
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade300,
                      padding: EdgeInsets.symmetric(horizontal: 65, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      "Book Now",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        );
    }
}
