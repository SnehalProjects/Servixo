import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:servixo2/Screens/CategoriesScreen.dart';
import 'package:servixo2/Screens/ScheduleScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:servixo2/Screens/HomeScreen.dart';
import 'ProfileDetailScreen.dart';
import 'SettingScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> profiles = [
    {
      "image": "assets/ProfileImg/Electrician.jpg",
      "role": "John Smith",
      "description": "Carpenter",
      "cost": "₹50/hr",
      "rating": "4.5",
      "about": "I am John Smith, a professional carpenter with over 10 years of experience in crafting and designing wooden structures. I have worked on various residential and commercial projects."
    },
    {
      "image": "assets/ProfileImg/Plumber.png",
      "role": "Emily Johnson",
      "description": "Plumber",
      "cost": "₹40/hr",
      "rating": "4.2",
      "about": "I am Emily Johnson, a skilled plumber with over 8 years of experience. I specialize in installing and repairing water systems."
    },
    {
      "image": "assets/ProfileImg/Furniture.jpg",
      "role": "Michael Brown",
      "description": "Cook",
      "cost": "₹30/hr",
      "rating": "4.6",
      "about": "I am Michael Brown, a passionate and skilled cook with over 5 years of experience in preparing delicious and balanced meals. Always aiming to create a memorable dining experience."
    },
    {
      "image": "assets/ProfileImg/carpenter.jpg",
      "role": "David Wilson",
      "description": "Carpenter",
      "cost": "₹55/hr",
      "rating": "4.7",
      "about": "I am David Wilson, a highly experienced carpenter with over 15 years of expertise in woodworking. My craftsmanship ensures both durability and design excellence in every project."
    },
    {
      "image": "assets/ProfileImg/Painter.jpg",
      "role": "Sophia Martinez",
      "description": "Painter",
      "cost": "₹45/hr",
      "rating": "4.3",
      "about": "I am Sophia Martinez, a professional painter with a decade of experience. I specialize in transforming spaces with both decorative and industrial painting."
    },
    {
      "image": "assets/ProfileImg/Gardner.jpg",
      "role": "Liam Taylor",
      "description": "Gardener",
      "cost": "₹35/hr",
      "rating": "4.8",
      "about": "I am Liam Taylor, an experienced gardener with over 7 years of expertise in plant care, soil management, and landscape design. I help create and maintain vibrant."
    },
    {
      "image": "assets/ProfileImg/Driver.jpg",
      "role": "Olivia Thomas",
      "description": "Driver",
      "cost": "₹60/hr",
      "rating": "4.4",
      "about": "I am Olivia Thomas, a professional driver with over 6 years of safe and efficient driving experience. I ensure timely, safe transport whether you need to travel for business or leisure."
    },
    {
      "image": "assets/ProfileImg/Nurse.jpg",
      "role": "James Davis",
      "description": "Nurse",
      "cost": "₹80/hr",
      "rating": "4.9",
      "about": "I am James Davis, a compassionate nurse with over 10 years of experience in healthcare. I offer emotional and physical care to patients."
    },
    {
      "image": "assets/ProfileImg/Maid.jpg",
      "role": "Charlotte Miller",
      "description": "Maid",
      "cost": "₹25/hr",
      "rating": "4.5",
      "about": "I am Charlotte Miller, a dedicated maid with over 5 years of experience in maintaining cleanliness and order in homes and businesses. My goal is to create a fresh environment for you to enjoy every day."
    },
    {
      "image": "assets/ProfileImg/Cleaning.jpg",
      "role": "Ethan Wilson",
      "description": "Cleaning",
      "cost": "₹30/hr",
      "rating": "4.6",
      "about": "I am Ethan Wilson, a professional cleaner with over 7 years of experience in sanitizing and organizing spaces. Whether it’s routine cleaning or deep sanitation."
    },
    {
      "image": "assets/ProfileImg/cook.jpg",
      "role": "Ava Moore",
      "description": "Cook",
      "cost": "₹35/hr",
      "rating": "4.7",
      "about": "I am Ava Moore, a dedicated cook with over 6 years of experience in preparing delicious meals. I am passionate about creating culinary experiences that delight and satisfy."
    }
  ];

  List<Map<String, dynamic>> filteredProfiles = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProfiles = profiles;
  }

  void filterProfiles(String query) {
    setState(() {
      filteredProfiles = profiles
          .where((profile) => profile["role"]!.toLowerCase().contains(query.toLowerCase()) ||
          profile["description"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(width: 10),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context) => SettingsScreen()),
            );
          },
        ),
            SizedBox(width: 10),
          ],
        ),
        backgroundColor: Colors.indigo.shade50,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: TextField(
                controller: searchController,
                onChanged: filterProfiles,
                decoration: InputDecoration(
                  hintText: "Search by role or description",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: filteredProfiles.map((profile) {
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(15),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: AssetImage(profile["image"]!),
                        ),
                        title: Text(
                          profile["role"]!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${profile["description"]!}",
                              style: TextStyle(color: Colors.black87),
                            ),
                            Text(
                              "Cost: ${profile["cost"]!}",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[700]),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: double.tryParse(profile["rating"].toString().trim()) ?? 0.0,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                SizedBox(width: 8),
                                Text("${profile["rating"]}"),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            profile.containsKey("isSaved") && profile["isSaved"]
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: Colors.indigo[400],
                          ),
                          onPressed: () {
                            setState(() {
                              profile["isSaved"] = !(profile.containsKey("isSaved") && profile["isSaved"]);
                            });
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileDetailPage(
                                name: profile["role"],
                                cost: profile["cost"],
                                rating: profile["rating"],
                                image: profile["image"],
                                about: profile["about"],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white,
            color: Colors.indigo.shade100,
            buttonBackgroundColor: Colors.black12,
            height: 60,
            index: 3,
            items: <Widget>[
              Icon(Icons.home, size: 30, color: Colors.white),      // Index 0
              Icon(Icons.list, size: 30, color: Colors.white),      // Index 1
              Icon(Icons.calendar_month, size: 30, color: Colors.white),  // Index 2
              Icon(Icons.person, size: 30, color: Colors.white),    // Index 3
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
