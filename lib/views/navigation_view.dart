import 'package:fyp/views/reward_view.dart';
import 'package:fyp/views/statistic_view.dart';
import 'package:flutter/material.dart';
import 'history_view.dart';
import 'package:fyp/views/profile_view.dart';
import 'home_view.dart';


// TO VIEW THE  BOTTOM NAVIGATION AND RANGKA APP
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final primaryColor = const Color(0xFF8E24AA);
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    HistoryPage(),
    StatisticsPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenditure App", style: TextStyle(fontSize: 25)),
        backgroundColor: primaryColor,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.card_giftcard),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RewardView()));
              }),

        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home", style: new TextStyle(fontSize: 16.0),),
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.history),
              title: new Text("History", style: new TextStyle(fontSize: 16.0),),
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.equalizer),
              title: new Text(
                "Statistics", style: new TextStyle(fontSize: 16.0),),
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              title: new Text("Account", style: new TextStyle(fontSize: 18.0),),
              backgroundColor: primaryColor,
            ),
          ]
      ),
    );
  }



  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}