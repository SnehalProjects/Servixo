import 'package:servixo2/Screens/ScheduleScreen.dart';
import 'package:flutter/material.dart';

class CarpenterScreen extends StatefulWidget {
  const CarpenterScreen({Key? key}) : super(key: key);

  @override
  _CarpenterScreenState createState() => _CarpenterScreenState();
}

class _CarpenterScreenState extends State<CarpenterScreen> {
  // repairs to clean
  List<dynamic> _list = [
    ['Drill & Hang','https://img.icons8.com/color/2x/drill.png', Colors.red,0],
    ['Doors Lock','https://img.icons8.com/color/2x/door.png',Colors.orange,1],
    ['Table/Chair wheel', 'https://img.icons8.com/color/2x/bath.png', Colors.blue, 1],
    ['Cup Board Hinge', 'https://img.icons8.com/color/2x/cupboard.png', Colors.purple, 1],
    ['fixing squeaky ', 'https://img.icons8.com/color/2x/support.png', Colors.green, 0],
    ['wall hanger', 'https://img.icons8.com/color/2x/towel.png', Colors.yellow, 0],
    ['Tv installation ', 'https://img.icons8.com/color/2x/tv.png', Colors.pink, 0],
  ];

  List<int> _selectedWork = [];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //back button
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40.0, left: 20.0),
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
                      child: Text(
                        'What do you want \nto fix?',
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
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return repair(_list[index], index);
                  },
                ),
              ),
            ),
          ),
        ],
      ),

      // back button end

      floatingActionButton: _selectedWork.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScheduleScreen()),
                );
              },
        backgroundColor: Color.fromARGB(255, 197, 202, 233),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_selectedWork.length}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 2),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ],
              ),
            )
          : null,
    );
  }

  Widget repair(List repair, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedWork.contains(index))
            _selectedWork.remove(index);
          else
            _selectedWork.add(index);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _selectedWork.contains(index)
              ? repair[2].shade50.withOpacity(0.5)
              : Colors.grey.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Image.network(
                      repair[1],
                      width: 35,
                      height: 35,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      repair[0],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Spacer(),
                _selectedWork.contains(index)
                    ? Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 20,
                        ),
                      )
                    : SizedBox()
              ],
            ),
            (_selectedWork.contains(index) && repair[3] >= 1)
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "How many ${repair[0]}s?",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    repair[3] = index + 1;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.0),
                                  padding: EdgeInsets.all(10.0),
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: repair[3] == index + 1
                                        ? repair[2].withOpacity(0.5)
                                        : repair[2].shade200.withOpacity(0.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: CarpenterScreen()));
}
