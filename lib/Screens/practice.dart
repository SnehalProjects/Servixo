
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget commonCard({
    required String title,
    required String imagePath,
    required Function() onTap,
  }) {
    return Card(
      elevation: 5,
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/image.png'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning 👋", style: TextStyle(fontSize: 14, color: Colors.grey)),
            Text("Andrew Ainsley", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
        actions: [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.settings, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
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

            Text("What are you looking \nfor today?", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/carpenter_img1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/cleaning_img1.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/electrician_img1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/homePage_img1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/plumber_img1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See All", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonCard(
                      title: 'Cleaning',
                      imagePath: 'assets/cleaning_img1.webp',
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const CleaningScreen()));
                      },
                    ),
                    commonCard(
                      title: 'Electrician',
                      imagePath: 'assets/electrician_img1.jpg',
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectricianScreen()));
                      },
                    ),
                    commonCard(
                      title: 'Carpenter',
                      imagePath: 'assets/carpenter_img1.png',
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const CarpenterScreen()));
                      },
                    ),
                    commonCard(
                      title: 'Plumbing',
                      imagePath: 'assets/plumber_img1.jpg',
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const PlumberScreen()));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonCard(
                      title: 'Gardening',
                      imagePath: 'assets/gardner_img1.jpg',
                      onTap: () {},
                    ),
                    commonCard(
                      title: 'Driver',
                      imagePath: 'assets/driver_img1.jpg',
                      onTap: () {},
                    ),
                    commonCard(
                      title: 'Nursing Care',
                      imagePath: 'assets/nurse_img1.jpg',
                      onTap: () {},
                    ),
                    commonCard(
                      title: 'Painter',
                      imagePath: 'assets/painter_img1.jpg',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
