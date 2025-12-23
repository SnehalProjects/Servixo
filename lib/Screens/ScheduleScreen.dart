// import 'package:day35/animation/FadeAnimation.dart';
// import 'package:day35/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Example import statement
import 'package:servixo2/Screens/ProfileScreen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:servixo2/Screens/HomeScreen.dart';
import 'package:servixo2/Screens/CategoriesScreen.dart';
import 'package:servixo2/Screens/SettingScreen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}


class _ScheduleScreenState extends State<ScheduleScreen> {
  int _selectedRepeat = 0;
  String _selectedHour = '13:30';
  List<int> _selectedExteraCleaning = [];

  // ItemScrollController scrollController = ItemScrollController();

  final List<String> _hours = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  final List<String> _repeat = [
    'No repeat',
    'Every day',
    'Every week',
    'Every month'
  ];

  final List<dynamic> _exteraCleaning = [
    ['Washing', 'https://img.icons8.com/office/2x/washing-machine.png', '10'],
    ['Fridge', 'https://img.icons8.com/cotton/2x/fridge.png', '8'],
    [
      'Oven',
      'https://img.icons8.com/external-becris-lineal-color-becris/2x/external-oven-kitchen-cooking-becris-lineal-color-becris.png',
      '8'
    ],
    [
      'Vehicle',
      'https://img.icons8.com/external-vitaliy-gorbachev-blue-vitaly-gorbachev/2x/external-bycicle-carnival-vitaliy-gorbachev-blue-vitaly-gorbachev.png',
      '20'
    ],
    [
      'Windows',
      'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-window-interiors-kiranshastry-lineal-color-kiranshastry-1.png',
      '20'
    ],
  ];

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      // scrollController.scrollTo
      (
      index: 24,
      duration: Duration(seconds: 3),
      curve: Curves.easeInOut,
      );
    });

    super.initState();
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 197, 202, 233),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        },
        child: Icon(Icons.arrow_forward_ios),
      ),

      //back button
      body: Column(
        children: [
          // Custom back button
          // Container(
          //   padding: EdgeInsets.only(top: 30, left: 20.0),
          //   alignment: Alignment.centerLeft,
          //   child: IconButton(
          //     icon: Icon(Icons.arrow_back_ios),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ),

          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
                      child: Text(
                        'Select Date \nand Time',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ];
              },
              body: Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //Dates
                      Container(
                        height: 200,
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70,
                          border:
                          Border.all(width: 1.5, color: Colors.grey.shade300),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            EasyDateTimeLine(
                              initialDate: DateTime.now(),
                              onDateChange: (selectedDate) {
                                //[selectedDate] the new date selected.
                              },
                              dayProps: const EasyDayProps(
                                activeDayDecoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 159, 168, 218),// Lighter shade of the background color
                                      Color.fromARGB(255, 121, 134, 203) // Darker side
                                    ], //date
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border:
                          Border.all(width: 1.5, color: Colors.grey.shade300),
                        ),
                        child: ScrollablePositionedList.builder(
                          // itemScrollController: _scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: _hours.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedHour = _hours[index];
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: _selectedHour == _hours[index]
                                        ? Color.fromARGB(255, 197, 202, 233) //select hour inside color
                                        .withOpacity(0.5)
                                        : const Color.fromARGB(255, 197, 202, 233)
                                        .withOpacity(0),
                                    border: Border.all(
                                      color: _selectedHour == _hours[index]
                                          ? Color.fromARGB(255, 92, 107, 192) //select hour border color
                                          : Colors.white.withOpacity(0),
                                      width: 1.5,
                                    ),
                                  ), //time
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _hours[index],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Repeat",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _repeat.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedRepeat = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: _selectedRepeat == index
                                        ? Color.fromARGB(255, 121, 134, 203)
                                        : Colors.grey.shade100, //Repeat
                                  ),
                                  margin: EdgeInsets.only(right: 20),
                                  child: Center(
                                      child: Text(
                                        _repeat[index],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: _selectedRepeat == index
                                                ? Colors.white
                                                : Colors.grey.shade800),
                                      )),
                                ),
                              );
                            },
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Additional Services",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _exteraCleaning.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (_selectedExteraCleaning.contains(index)) {
                                      _selectedExteraCleaning.remove(index);
                                    } else {
                                      _selectedExteraCleaning.add(index);
                                    }
                                  });
                                },
                                child: Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                      _selectedExteraCleaning.contains(index)
                                          ? Color.fromARGB(255, 159, 168, 218)
                                          : Colors.transparent,
                                    ),
                                    margin: EdgeInsets.only(right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          _exteraCleaning[index][1],
                                          height: 40,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          _exteraCleaning[index][0],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: _selectedExteraCleaning
                                                  .contains(index)
                                                  ? Colors.white
                                                  : Colors.grey.shade800),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "+${_exteraCleaning[index][2]}\₹",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    )),
                              );
                  
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // ],
      //   ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.indigo.shade100,
        buttonBackgroundColor: Colors.black12,
        height: 60,
        index: 2,
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
