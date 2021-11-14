import 'package:fyp/models/category_data.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp/models/Reward.dart';


// TO VIEW REWARD PAGE
class RewardView extends StatefulWidget {
  final Category category;
  final Reward reward;

  const RewardView({Key key, this.category, this.reward}) : super(key: key);

  @override
  _RewardViewState createState() => _RewardViewState();
}

class _RewardViewState extends State<RewardView> {
  final primaryColor = const Color(0xFF8E24AA);
  final db = Firestore.instance;
  Reward reward;
  Category category;
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime(2021,1,30);
  DateTime date3 = DateTime(2021,2,30);
  DateTime date4 = DateTime(2021,3,30);
  DateTime date5 = DateTime(2021,4,30);
  DateTime date6 = DateTime(2021,5,30);
  bool _isRewardOn1 = false;
  bool _isRewardOn2 = false;
  bool _isRewardOn3 = false;
  bool _isRewardOn4 = false;
  bool _isRewardOn5 = false;
  bool _isRewardOn6 = false;
  bool _isRewardOn7 = false;
  bool _isRewardOn8 = false;
  bool _isRewardOn9 = false;
  bool _isRewardOn10 = false;
  bool _isRewardOn11 = false;
  bool _isRewardOn12 = false;
  bool _isRewardOn13 = false;
  bool _isRewardOn14 = false;
  bool _isRewardOn15 = false;
  Icon rewardOff1 = Icon(Icons.lock, size: 80,);
  Icon rewardOff2 = Icon(Icons.lock, size: 80,);
  Icon rewardOff3 = Icon(Icons.lock, size: 80,);
  Icon rewardOff4 = Icon(Icons.lock, size: 80,);
  Icon rewardOff5 = Icon(Icons.lock, size: 80,);
  Icon rewardOff6 = Icon(Icons.lock, size: 80,);
  Icon rewardOff7 = Icon(Icons.lock, size: 80,);
  Icon rewardOff8 = Icon(Icons.lock, size: 80,);
  Icon rewardOff9 = Icon(Icons.lock, size: 80,);
  Icon rewardOff10 = Icon(Icons.lock, size: 80,);
  Icon rewardOff11 = Icon(Icons.lock, size: 80,);
  Icon rewardOff12 = Icon(Icons.lock, size: 80,);
  Icon rewardOff13 = Icon(Icons.lock, size: 80,);
  Icon rewardOff14 = Icon(Icons.lock, size: 80,);
  Icon rewardOff15 = Icon(Icons.lock, size: 80,);
  Icon rewardOn1 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn2 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn3 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn4 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn5 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn6 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn7 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn8 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn9 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn10 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn11 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn12 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn13 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn14 = Icon(Icons.lock_open, size: 80,);
  Icon rewardOn15 = Icon(Icons.lock_open, size: 80,);

  external int get day;


  @override
  Widget build(BuildContext context)  {

    return Scaffold(
        appBar: AppBar(
          title: Text('Reward'),
          backgroundColor: primaryColor,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.info_outline), onPressed: (){
              showAlertDialog2(context);
            })
],
        ),
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                new Container(
                  color: Colors.deepPurple[100],
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: new Column(
                      children: <Widget>[
                        Text('You can unlock the lock by fulfilling the whole month spending'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurple[200],
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: new Column(
                      children: <Widget>[
                        Text("Reward Lock for 5 Months", style: TextStyle(fontSize: 29, ),),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurple[100],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0, right: 4.0),
                    child: GestureDetector(
                      child: Container(
                          child: Column(
                            children: <Widget>[

                              Padding(padding: EdgeInsets.all(0),
                                child: Row(
                                  children: <Widget>[

                                    _isRewardOn1 ? rewardOn1 : rewardOff1,
                                    _isRewardOn2 ? rewardOn2 : rewardOff2,
                                    _isRewardOn3 ? rewardOn3 : rewardOff3,
                                    _isRewardOn4 ? rewardOn4 : rewardOff4,
                                    _isRewardOn5 ? rewardOn5 : rewardOff5,
                                  ],
                                ),),

                            ],
                          )
                      ),

                      onTap: () async {
                        final category = Firestore.instance.collection('Category').reference();
                        setState(() {
                          if (  category != null) {
                            _isRewardOn1 = !_isRewardOn1;
                            _isRewardOn2 = !_isRewardOn2;
                            _isRewardOn3 = !_isRewardOn3;
                            _isRewardOn4 = !_isRewardOn4;
                            _isRewardOn5 = !_isRewardOn5;
                            showAlertDialog(context);
                          }
                        }
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurple[200],
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: new Column(
                      children: <Widget>[
                        Text("Reward Lock for 5 Months", style: TextStyle(fontSize: 29, ),),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurple[100],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0, right: 4.0),
                    child: GestureDetector(
                      child: Container(
                          child: Column(
                            children: <Widget>[

                              Padding(padding: EdgeInsets.all(0),
                                child: Row(
                                  children: <Widget>[

                                    _isRewardOn11 ? rewardOn11 : rewardOff11,
                                    _isRewardOn12 ? rewardOn12 : rewardOff12,
                                    _isRewardOn13 ? rewardOn13 : rewardOff13,
                                    _isRewardOn14 ? rewardOn14 : rewardOff14,
                                    _isRewardOn15 ? rewardOn15 : rewardOff15,
                                  ],
                                ),),

                            ],
                          )
                      ),

                      onTap: () async {
                        final category = Firestore.instance.collection('Category').reference();
                        setState(() {
                          if (  category != null) {
                            _isRewardOn11 = !_isRewardOn11;
                            _isRewardOn12 = !_isRewardOn12;
                            showAlertDialog1(context);
                          }
                        }
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurple[200],
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: new Column(
                      children: <Widget>[
                        Text("Reward Lock for 5 Months", style: TextStyle(fontSize: 29, ),),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurple[100],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0, right: 4.0),
                    child: GestureDetector(
                      child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(0),
                                child: Row(
                                  children: <Widget>[
                                    _isRewardOn6 ? rewardOn6 : rewardOff6,
                                    _isRewardOn7 ? rewardOn7 : rewardOff7,
                                    _isRewardOn8 ? rewardOn8 : rewardOff8,
                                    _isRewardOn9 ? rewardOn9 : rewardOff9,
                                    _isRewardOn10 ? rewardOn10 : rewardOff10,
                                  ],
                                ),),

                            ],
                          )
                      ),

                      onTap: () async {
                        final category = Firestore.instance.collection('Category').where('date').reference();

                        setState(() {
                          while ( date1.day != 15 ) {
                            int lock;
                            if (  category != null ) {
                              // ignore: unrelated_type_equality_checks
                              if (category == date2.month){
                                _isRewardOn6 = !_isRewardOn6;
                                lock =1;
                                // ignore: unrelated_type_equality_checks
                                if (category == date3.month){
                                  _isRewardOn7 = !_isRewardOn7;
                                  lock =2;
                                  // ignore: unrelated_type_equality_checks
                                  if (category == date4.month){
                                    _isRewardOn8 = !_isRewardOn8;
                                    lock =3;
                                    // ignore: unrelated_type_equality_checks
                                    if (category == date5.month){
                                      _isRewardOn9 = !_isRewardOn9;
                                      lock =4;
                                      // ignore: unrelated_type_equality_checks
                                      if (category == date6.month){
                                        _isRewardOn10 = !_isRewardOn10;
                                        lock = 5;
                                        if (lock==5){
                                          showAlertDialog(context);
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }


                        }
                        );
                      },
                    ),
                  ),
                ),
              ]),
        )

    );

  }
  showAlertDialog (BuildContext context){

    // set up the buttons

    Widget closeButton = FlatButton(
      child: Text("Close", style: TextStyle(color: Colors.black),),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("CONGRATULATIONS! "),
      content: Text("Your code is 8UT5iHY" , style: TextStyle(fontSize: 20),),
      backgroundColor: Colors.green[300],
      actions: [
        closeButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog1 (BuildContext context){


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("3 MORE TO GO", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      content: Text("You can get the reward code after unlock all the lock" ),
      backgroundColor: Colors.green[300],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog2 (BuildContext context){



    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("GRAB THE CHANCE TO GET THE REWARD NOW", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      content: Text("You have to unlock all 5 lock to get the chance to GRAB the REWARD"),
      backgroundColor: Colors.green[200],

    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}







