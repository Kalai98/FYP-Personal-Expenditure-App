import 'package:fyp/views/adhoc_view.dart';
import 'package:fyp/views/discretionary_view.dart';
import 'package:fyp/views/food_view.dart';
import 'package:fyp/views/health_view.dart';
import 'package:fyp/views/housing_view.dart';
import 'package:fyp/views/personal_care_view.dart';
import 'package:fyp/views/savings_view.dart';
import 'package:fyp/views/social_participation_view.dart';
import 'package:fyp/views/transport_view.dart';
import 'package:fyp/views/utilities_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

//HOME VIEW
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('flutter_devs');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }
  // ignore: missing_return
  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return NewScreen(
        payload: payload,
      );
    }));
  }
  showNotification() async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Reward', 'Flutter Local Notification Demo', platform,
        payload: 'Please update the spending ');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFEDE7F6),
      body:
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
             ListTile(
              title: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(0),
                  child: Row(
                    children: <Widget>[

                      Text('Welcome,',style: TextStyle(fontSize: 30)),
                      IconButton( icon: Icon(Icons.info_outline),
                        onPressed: () {
                        showAlertDialog(context);
                        },
                        ),
                    ],
                  ),)

                ],
              ),
              subtitle: Text('Lets start tracking your expenses by clicking on each icon',style: TextStyle(fontSize: 22)),
            ),


            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[

                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.fastfood, size: 80),
                          Text('Food', style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[100],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FoodRoute()),
                        );
                      }
                  ),
                ),
                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.home, size: 80),
                          Text('Housing', style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[200],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HousingRoute ()),
                        );
                      }
                  ),
                ),
                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.healing, size: 80),
                          Text('Health', style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[200],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HealthRoute()),
                        );
                      }

                  ),
                ),
                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.account_balance_wallet, size: 80),
                          Text('Saving', style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[100],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SavingsRoute()),
                        );
                      }
                  ),
                ),
                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.shopping_cart, size: 80),
                          Text('Discretionary Expenses',textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[100],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>DiscretionaryExpensesRoute()),
                        );
                      }
                  ),
                ),
                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.directions_car, size: 80),
                          Text('Transport', style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[200],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TransportRoute()),
                        );
                      }
                  ),
                ),
                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.build, size: 80),
                          Text('Utilities', style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[200],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UtilitiesRoute()),
                        );
                      }
                  ),
                ),
                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.lightbulb_outline, size: 80),
                          Text('Personal Care',textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[100],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PersonalCareRoute()),
                        );
                      }
                  ),
                ),
                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.people_outline, size: 80),
                          Text('Social Participation',textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[100],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SocialParticipationRoute()),
                        );
                      }
                  ),
                ),
                new Container(

                  child: RaisedButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.monetization_on, size: 80),
                          Text('Ad Hoc/One-off ',textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
                        ],),
                      color: Colors.deepPurple[200],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdHocOneOffRoute()),
                        );
                      }
                  ),
                ),
              ],
            ),
          ],),),);
  }

  showAlertDialog (BuildContext context){

    // set up the buttons

    Widget yesButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () {
        Navigator.pop(context);
        showAlertDialog1(context);

      },
    );
    Widget noButton = FlatButton(
      child: Text("No", style: TextStyle(color: Colors.red[500]),),
      onPressed:  () {
        Navigator.pop(context);
        showAlertDialog2(context);

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Would you like to receive notification about spending and reward?"),
      actions: [
        yesButton,
        noButton,
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
      title: Text("You have consented to receive the notification about spending and the reward entitlement"),
      backgroundColor: Colors.blue[300],
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
showAlertDialog2 (BuildContext context){

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("You will not receive any notifications regarding update spending and reward entitlement"),
    backgroundColor: Colors.red[200],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// ignore: must_be_immutable
class NewScreen extends StatelessWidget {
  String payload;

  NewScreen({
    @required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(payload),
      ),
    );
  }
}


