import 'package:fyp/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:fyp/models/category_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'dart:async';

//TO VIEW THE PERSONAL CARE PAGE TO ADD EXPENSE, BUDGET AND DATE
class  PersonalCareRoute extends StatefulWidget {
  final Category care;

  const  PersonalCareRoute({Key key, this.care}) : super(key: key);
  @override
  _PersonalCareRouteState createState() => _PersonalCareRouteState();
}

class _PersonalCareRouteState extends State< PersonalCareRoute> {
  Category care;
  String type1 = "Personal Care";
  DateTime _dateTime = DateTime.now();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _budgetController;
  TextEditingController _expensesController;



  @override
  void initState() {
    super.initState();
    _budgetController =
        TextEditingController(text:  '');
    _expensesController =
        TextEditingController(text: '');


  }
  Future displayDateRangePicker (BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: new DateTime(2015),
      lastDate: new DateTime(2026) ,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: Colors.purple,
            ),
          ),
          child: child,
        );
      },);
    if (picked !=null && picked != _dateTime ){
      setState(() {
        _dateTime = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE7F6),
      appBar: AppBar(
        backgroundColor: Color(0xFF8E24AA),
        title: const Text('Personal Care', style: TextStyle(fontSize: 30)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image(image: null,),
              const SizedBox(height: 50.0),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                controller: _budgetController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Budget field cannot be empty";
                  return null;
                },

                decoration: InputDecoration(

                  labelText: "Budget(RM)",
                  labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                controller: _expensesController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Expenses field cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Expenses(RM)",
                  labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30.0),
              RaisedButton(
                  color: Colors.white24,
                  child: Text("Select Date",style :TextStyle(color: Colors.black, fontSize:20.0)),
                  onPressed: () async {
                    await displayDateRangePicker(context);
                  }),
              Text("Date : ${DateFormat('MM/dd/yyyy').format(_dateTime).toString()}",style :TextStyle(color: Colors.black, fontSize:20.0)),
              const SizedBox(height: 30.0),

              new Center(child:RaisedButton(
                shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.green)
                ),
                padding: const EdgeInsets.all(15.0),
                color: Colors.green,
                textColor: Colors.white,
                child: Text("Save", style: new TextStyle(fontSize: 20.0, color: Colors.white),),

                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      Category care = Category(
                        expenses:double.parse(_expensesController.text),
                        budget:double.parse(_budgetController.text),
                        date:_dateTime,
                        type: type1,
                      );
                      await FirestoreService().addData(care);

                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              ),),
            ],
          ),
        ),
      ),
    );
  }

}
