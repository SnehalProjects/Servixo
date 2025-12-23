import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        'image': 'assets/carpenter_img1.png',
        'title': 'AC Cleaning at Home',
        'subtitle': 'Clean AC, save energy',
        'price': '\$468/hour',
        'rating': '4.7'
      },
      {
        'image': 'assets/cleaning_img1.webp',
        'title': 'Home Cleaning',
        'subtitle': 'Clean Home, feel fresh',
        'price': '\$596/hour',
        'rating': '4.5'
      },
      {
        'image': 'assets/cook_img1.jpg',
        'title': 'Plumbing Service',
        'subtitle': 'Fix leaks, maintain flow',
        'price': '\$320/hour',
        'rating': '4.6'
      },
      {
        'image': 'assets/driver_img1.jpg',
        'title': 'Electrician Service',
        'subtitle': 'Power up safely',
        'price': '\$410/hour',
        'rating': '4.8'
      },
      {
        'image': 'assets/gardner_img1.jpg',
        'title': 'Home Painting',
        'subtitle': 'Brighten up your home',
        'price': '\$500/hour',
        'rating': '4.4'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Popular Service')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Service", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("See all", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            CarouselSlider(
              items: services.map((service) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Container(
                    width: 250,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(service['image'], width: double.infinity, height: 120, fit: BoxFit.cover),
                        ),
                        SizedBox(height: 10),
                        Text(service['title'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(service['subtitle'], style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(service['price'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 16),
                                Text(service['rating'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 250,
                enlargeCenterPage: true,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                enableInfiniteScroll: true,
                viewportFraction: 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
