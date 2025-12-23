import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:servixo2/Screens/HomeScreen.dart';
import 'package:servixo2/Screens/ScheduleScreen.dart';
import 'package:servixo2/Screens/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:servixo2/Screens/SettingScreen.dart';

void main() => runApp(const CategoriesScreen());

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:Colors.indigo.shade50,
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
        body: const HomePage(),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.indigo.shade100,
          buttonBackgroundColor: Colors.black12,
          height: 60,
          index: 1,
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
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget commonCard({
    required String title,
    required String imagePath,
    required Color background,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Card(
        elevation: 10,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: const Color.fromARGB(255, 218, 224, 248).withAlpha(30),
          onTap: onTap,
          child: SizedBox(
            width: 160,
            height: 160,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(title, style: const TextStyle(fontSize: 18)),
                ),
                Image.asset(imagePath, width: 200, height: 110),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Image.asset('assets/homePage_img1.png'),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(29, 10, 20, 10),
            child: Text(
              'Which Service do you need?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          commonCard(
                            title: 'Cleaning',
                            background: Colors.white,
                            imagePath: 'assets/cleaning_img1.webp',
                            onTap: () {},
                          ),
                          commonCard(
                            title: 'Carpenter',
                            background: Colors.white,
                            imagePath: 'assets/carpenter_img1.png',
                            onTap: () {},
                          ),
                          commonCard(
                            title: 'Gardening',
                            background: Colors.white,
                            imagePath: 'assets/gardner_img1.jpg',
                            onTap: () {},
                          ),
                          commonCard(
                            title: 'Driver',
                            background: Colors.white,
                            imagePath: 'assets/driver_img1.jpg',
                            onTap: () {},
                          ),
                          commonCard(
                            title: 'Nursing Care',
                            background: Colors.white,
                            imagePath: 'assets/nurse_img1.jpg',
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(width: 11), // Space between columns
                      Column(
                        children: [
                          commonCard(
                            title: 'Electrician',
                            background: const Color.fromARGB(255, 231, 253, 249),
                            imagePath: 'assets/electrician_img1.jpg',
                            onTap: () {},
                          ),
                          commonCard(
                            title: 'Painter',
                            background: Colors.white,
                            imagePath: 'assets/painter_img1.jpg',
                            onTap: () {},
                          ),
                          commonCard(
                            title: 'Plumbing',
                            background: const Color.fromARGB(255, 231, 253, 249),
                            imagePath: 'assets/plumber_img1.jpg',
                            onTap: () {},
                          ),
                          commonCard(
                            title: 'Maid',
                            background: const Color.fromARGB(255, 231, 253, 249),
                            imagePath: 'assets/maid_img1.png',
                            onTap: () {},
                          ),
                          commonCard(
                            title: 'Cook',
                            background: const Color.fromARGB(255, 231, 253, 249),
                            imagePath: 'assets/cook_img1.jpg',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
