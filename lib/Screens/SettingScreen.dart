import 'package:flutter/material.dart';
import 'package:servixo2/Screens/CategoriesScreen.dart';
import 'package:servixo2/Screens/ProfileScreen.dart';
import 'package:servixo2/Screens/ScheduleScreen.dart';
import 'package:servixo2/Screens/Aboutus.dart';
import 'package:servixo2/Screens/UpdateProfile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isNotificationsEnabled = true;

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
          SizedBox(width: 10),
          Icon(Icons.settings, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            // Container(
            //   padding: EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [Colors.purple.shade300, Colors.purple.shade300],
            //     ),
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(30),
            //       bottomRight: Radius.circular(30),
            //     ),
            //   ),
            //   // child: Row(
            //   //   children: [
            //   //     CircleAvatar(
            //   //       radius: 40,
            //   //       backgroundImage: AssetImage("assets/user.png"), // Add user image
            //   //     ),
            //   //     SizedBox(width: 15),
            //   //     Column(
            //   //       crossAxisAlignment: CrossAxisAlignment.start,
            //   //       children: [
            //   //         Text(
            //   //           "Sarvangi Zalavadia",
            //   //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            //   //         ),
            //   //         Text(
            //   //           "sarvangi039gmail.com",
            //   //           style: TextStyle(fontSize: 14, color: Colors.white70),
            //   //         ),
            //   //       ],
            //   //     ),
            //   //   ],
            //   // ),
            // ),

            SizedBox(height: 20),

            // Settings List
            settingsCard([
              // buildListTile(Icons.person, "Profile Settings", "Update your details"),
              ListTile(
                leading: Icon(Icons.info, color: Colors.purple.shade300),
                title: Text("Profile Settings", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Version 1.0, Terms & Conditions", style: TextStyle(color: Colors.grey)),
                trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileSettingsScreen()),
                  );
                },
              ),

              buildListTile(Icons.payment, "Payment Methods", "Manage cards & UPI"),
              buildListTile(Icons.lock, "Security & Privacy", "Change password, enable 2FA"),
              buildListTile(Icons.language, "Language", "Change app language"),
            ]),

            settingsCard([
              buildSwitchTile(Icons.dark_mode, "Dark Mode", isDarkMode, (val) {
                setState(() {
                  isDarkMode = val;
                });
              }),
              buildSwitchTile(Icons.notifications, "Push Notifications", isNotificationsEnabled, (val) {
                setState(() {
                  isNotificationsEnabled = val;
                });
              }),
            ]),

            settingsCard([
              buildListTile(Icons.help, "Help & Support", "FAQs, Contact support"),
              // buildListTile(
              //     Icons.info, "About Us", "Version 1.0, Terms & Conditions"
              // ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.purple.shade300),
                title: Text("About Us", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Version 1.0, Terms & Conditions", style: TextStyle(color: Colors.grey)),
                trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsScreen()),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text("Logout", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                onTap: () {
                  // Implement Logout Functionality
                },
              ),
            ]),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple.shade300),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      onTap: () {
        // Handle navigation
      },
    );
  }

  Widget buildSwitchTile(IconData icon, String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.purple.shade300),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget settingsCard(List<Widget> children) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: Column(children: children),
    );
  }
}



