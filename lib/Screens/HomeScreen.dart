import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:servixo2/Screens/CategoriesScreen.dart';
import 'package:servixo2/Screens/ProfileScreen.dart';
import 'package:servixo2/Screens/ScheduleScreen.dart';
import 'package:servixo2/Screens/SettingScreen.dart';

import 'CarpenterScreen.dart';
import 'CleaningScreen.dart';
import 'ElectricianScreen.dart';
import 'PlumberScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> allServices = [
    {'title': 'Cleaning', 'image': 'assets/cleaning_img1.webp'},
    {'title': 'Electrician', 'image': 'assets/electrician_img1.jpg'},
    {'title': 'Carpenter', 'image': 'assets/carpenter_img1.png'},
    {'title': 'Plumbing', 'image': 'assets/plumber_img1.jpg'},
    {'title': 'Gardening', 'image': 'assets/gardner_img1.jpg'},
    {'title': 'Driver', 'image': 'assets/driver_img1.jpg'},
    {'title': 'Maid', 'image': 'assets/maid_img1.png'},
    {'title': 'Painter', 'image': 'assets/painter_img1.jpg'},
  ];
  List<Map<String, String>> filteredServices = [];

  @override
  void initState() {
    super.initState();
    filteredServices = List.from(allServices);
    searchController.addListener(_filterServices);
  }

  void _filterServices() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredServices = allServices
          .where((service) => service['title']!.toLowerCase().contains(query))
          .toList();
    });
  }

  Widget commonCard({
    required String title,
    required String imagePath,
    required Function() onTap,
  }) {
    return Card(
      elevation: 5,
      color: Colors.indigo.shade50,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: SizedBox(
          width: 80,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade50,
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade100,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/HomeScreen/user2.jpg'),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning 👋", style: TextStyle(fontSize: 14, color: Colors.white)),
              Text("Everyone", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
            ],
          ),
          actions: [
            Icon(Icons.notifications_none, color: Colors.black),
            SizedBox(width:10),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => SettingsScreen()),
                );
              },
            ),

            // Icon(Icons.settings, color: Colors.black),
            SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),

              Text("What are you looking \nfor today?", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),

              SizedBox(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 180,
                child: CarouselSlider(
                  items: [
                    for (var imagePath in [
                      "assets/carousel5.jpg",
                      "assets/carousel6.jpg",
                      "assets/carousel7.jpg",
                      "assets/carousel3.jpg",
                      "assets/carousel2.jpg",
                    ])
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                  options: CarouselOptions(
                    height: 180,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    viewportFraction: 1.0,
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoriesScreen()),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              filteredServices.isEmpty
                  ? Center(
                child: Text(
                  "No Data Found",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              )
                  :Column(
                children: List.generate(
                  (filteredServices.length / 4).ceil(),
                      (rowIndex) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        4,
                            (index) {
                          int serviceIndex = rowIndex * 4 + index;
                          if (serviceIndex < filteredServices.length) {
                            return commonCard(
                              title: filteredServices[serviceIndex]['title']!,
                              imagePath: filteredServices[serviceIndex]['image']!,

                              onTap: () {
                                String title = filteredServices[serviceIndex]['title']!;
                                if (title == 'Cleaning') {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CleaningScreen()));
                                } else if (title == 'Electrician') {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ElectricianScreen()));
                                } else if (title == 'Carpenter') {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CarpenterScreen()));
                                } else if (title == 'Plumbing') {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlumberScreen()));
                                } else if (title == 'Gardening' ||
                                    title == 'Driver' ||
                                    title == 'Maid' ||
                                    title == 'Painter') {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleScreen()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No screen found for $title')));
                                }
                              },
                            );
                          } else {
                            return SizedBox(width: 73, height: 90);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular Profiles", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()), // Navigate to CleaningScreen
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 250,
                child: CarouselSlider(
                  items: [
                    for (var service in [
                      {'image': 'assets/ProfileImg/Maid.jpg', 'title': 'Maid', 'subtitle': 'Reliable housekeeping & cleaning', 'price': '\₹25/hour', 'rating': '4.8'},
                      {'image': 'assets/ProfileImg/Painter.jpg', 'title': 'Painter', 'subtitle': 'Expert in interior & exterior painting', 'price': '\₹45/hour', 'rating': '4.3'},
                      {'image': 'assets/ProfileImg/Driver.jpg', 'title': 'Driver', 'subtitle': 'Skilled driver for all needs', 'price': '\₹60/hour', 'rating': '4.7'},
                      {'image': 'assets/ProfileImg/Nurse.jpg', 'title': 'Nurse', 'subtitle': 'Professional home care & support', 'price': '\₹80/hour', 'rating': '4.6'},
                    ])
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 4,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    service['image']!,
                                    width: double.infinity,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(service['title']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(service['subtitle']!, style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(service['price']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Row(children: [Icon(Icons.star, color: Colors.orange, size: 16), Text(service['rating']!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                  options: CarouselOptions(height: 250, enlargeCenterPage: true, autoPlay: false, viewportFraction: 0.6),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.indigo.shade100,
          buttonBackgroundColor: Colors.black12,
          height: 60,
          index: 0,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.list, size: 30, color: Colors.white),
            Icon(Icons.calendar_month, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            Widget screen;
            if (index == 0) {
              screen = HomeScreen();
            } else if (index == 1) {
              screen = CategoriesScreen();
            } else if (index == 2) {
              screen = ScheduleScreen();
            } else {
              screen = ProfileScreen();
            }

            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => screen,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(position: offsetAnimation, child: child);
                },
              ),
            );
          },
        ),
        );
    }
}
