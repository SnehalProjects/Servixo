import 'package:flutter/material.dart';


class ProfileDetailPage extends StatelessWidget {
  final String role;
  final String image;
  final String description;
  final double rating;
  final String cost;

  ProfileDetailPage({
    required this.role,
    required this.image,
    required this.description,
    required this.rating,
    required this.cost,
  });

  String getAboutMe() {
    switch (role) {
      case "Plumber":
        return "I am a skilled and certified plumber with 6 years of experience in residential and commercial plumbing services. I specialize in pipe installations, leak repairs, drainage systems, and water heater maintenance. Committed to delivering high-quality workmanship and excellent customer service, I ensure reliable and long-lasting plumbing solutions. Whether it's emergency repairs or new installations, I take pride in solving problems efficiently and professionally.";
      case "Electrician":
        return "I am a licensed electrician with 4 years of experience in handling residential, commercial, and industrial electrical systems. My expertise includes wiring, circuit installations, electrical panel upgrades, and troubleshooting electrical issues. Safety and efficiency are my top priorities, ensuring that every project meets industry standards. I am dedicated to providing reliable and cost-effective electrical solutions to meet the needs of my clients.";
      case "Driver":
        return "I am a professional driver with 5 years of experience in safe and efficient transportation. Skilled in operating various vehicles, I prioritize punctuality, road safety, and excellent customer service. Whether it's personal transportation, commercial delivery, or long-distance driving, I am committed to ensuring a smooth and comfortable journey. With a strong knowledge of traffic regulations and route optimization, I strive to provide the best driving experience.";
      case "Furniture":
        return "I am a skilled furniture cleaner with 5 years of experience in deep cleaning, stain removal, and upholstery care. I specialize in restoring the beauty of sofas, carpets, wooden furniture, and leather surfaces using safe and effective cleaning methods. I am committed to providing top-quality service and ensuring a fresh and hygienic environment for my clients.";
      case "Carpenter":
        return "I am a professional carpenter with 4 years of experience in custom furniture making, woodwork repairs, and interior fittings. I specialize in crafting high-quality wooden structures, cabinets, doors, and flooring with precision and attention to detail. My goal is to deliver durable and aesthetically pleasing carpentry solutions tailored to client needs.";
      case "Painter":
        return "I am an experienced painter specializing in residential and commercial painting services. With 7 years in the industry, I provide high-quality interior and exterior painting, wallpaper installation, and color consultation. I use premium paints and techniques to achieve long-lasting and visually appealing results, ensuring customer satisfaction.";
      case "Gardener":
        return "I am a professional gardener with expertise in landscaping, lawn care, and plant maintenance. With 2 years of experience, I specialize in designing and maintaining beautiful gardens, pruning trees, planting flowers, and ensuring a healthy outdoor environment. Passionate about greenery, I provide customized gardening solutions to enhance any space.";
      case "Nurse":
        return "I am a dedicated and compassionate nurse with 4 years of experience in patient care, medical assistance, and health monitoring. I specialize in providing professional healthcare services, administering medications, and offering support to patients and their families. Committed to delivering high-quality care with empathy and professionalism.";
      case "Maid":
        return "I am a professional maid with 5 years of experience in household cleaning, organization, and maintenance. I specialize in deep cleaning, laundry, dishwashing, and ensuring a hygienic and tidy living space. Dedicated to providing efficient and reliable services tailored to my clients' needs.";
      case "Cleaning":
        return "I am an experienced cleaning professional specializing in residential and commercial cleaning services. With 4 years in the field, I offer deep cleaning, dusting, floor polishing, and sanitization services using eco-friendly products. My focus is on delivering spotless and fresh spaces with attention to detail and efficiency.";
      case "Cook":
        return "I am a skilled cook with 2 years of experience in preparing delicious and nutritious meals. I specialize in a variety of cuisines, meal planning, and dietary-specific cooking. Passionate about food, I ensure high-quality, flavorful dishes that meet client preferences while maintaining hygiene and safety in the kitchen.";
      default:
        return "No details available.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade100,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/HomeScreen/user2.jpg'),
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context); // Navigates back to the previous screen
        //   },
        // ),
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
          Icon(Icons.settings, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage(image),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  role,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  description,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 28),
                  SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "About Me",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              SizedBox(height: 8),
              Text(
                getAboutMe(),
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 25),
              Text(
                "Service Cost: $cost",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 118, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Book Now",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}