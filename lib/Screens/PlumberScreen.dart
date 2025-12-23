import 'package:servixo2/Screens/ScheduleScreen.dart';
import 'package:flutter/material.dart';

class PlumberScreen extends StatefulWidget {
  const PlumberScreen({Key? key}) : super(key: key);

  @override
  _PlumberScreenState createState() => _PlumberScreenState();
}

class _PlumberScreenState extends State<PlumberScreen> {
  // fixing s to clean
  List<dynamic> _fixing  = [
    ['Tap Installation','https://img.icons8.com/color/2x/pumphouse.png', Colors.red,1],
    ['Bath fitting','https://img.icons8.com/color/2x/bath.png',Colors.orange,0],
    ['Water pipe', 'https://img.icons8.com/color/2x/piping.png', Colors.blue, 1],
    ['Washing Machine','https://img.icons8.com/dusk/2x/washing-machine.png', Colors.purple, 0],
    ['sink cleaning', 'https://img.icons8.com/color/2x/sink.png', Colors.green, 0]
  ];

  List<int> _plumbFixing = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: _plumbFixing.length > 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScheduleScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${_plumbFixing.length}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_forward_ios,size: 18,),
                  ],
                ),
            backgroundColor: Color.fromARGB(255, 197, 202, 233)
              )
            : null,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(top: 50.0, left: 30.0),
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context); // Navigate back
                      },
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
                  child: Text(
                    'What do you want \nto Fix?',
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
                itemCount: _fixing.length,
                itemBuilder: (BuildContext context, int index) {
                  return fixing(_fixing[index], index);
                }),
          ),
        ));
  }

  fixing(List fixing, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_plumbFixing.contains(index))
            _plumbFixing.remove(index);
          else
            _plumbFixing.add(index);
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: _plumbFixing.contains(index)
                ? fixing[2].shade50.withOpacity(0.5)
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
                        fixing[1],
                        width: 35,
                        height: 35,
                      ),
                      const SizedBox(width: 10.0,),
                      Text(
                        fixing[0],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  _plumbFixing.contains(index)
                      ? Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade100.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Icon(Icons.check,color: Colors.green,size: 20,)
                          )
                      : SizedBox()
                ],
              ),
              (_plumbFixing.contains(index) && fixing[3] >= 1)
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "How many ${fixing[0]}s?",
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
                                        fixing[3] = index + 1;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10.0),
                                      padding: EdgeInsets.all(10.0),
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: fixing[3] == index + 1
                                            ? fixing[2].withOpacity(0.5)
                                            : fixing[2]
                                                .shade200
                                                .withOpacity(0.5),
                                      ),
                                      child: Center(
                                          child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(fontSize: 22, color: Colors.white),
                                      )),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    )
                  : SizedBox()
            ],
          )),
    );
  }
}
