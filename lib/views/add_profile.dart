import 'package:fyp/models/UserProfile.dart';
import 'package:fyp/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddProfileInformation extends StatefulWidget {
  final UserProfile userProfile;

  const AddProfileInformation({Key key, this.userProfile}) : super(key: key);
  @override
  _AddProfileInformationState createState() => _AddProfileInformationState();
}

class _AddProfileInformationState extends State<AddProfileInformation> {
  // Initialize the variable that will be used in this file
  UserProfile userProfile;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  // Text controller for all element that needed to be added in USER PROFILE
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();
  TextEditingController _ethnicityController = new TextEditingController();
  TextEditingController _phoneNoController = new TextEditingController();
  TextEditingController _locationController = new TextEditingController();
  TextEditingController _houseCategoryController = new TextEditingController();
  TextEditingController _shortController = new TextEditingController();
  TextEditingController _longController = new TextEditingController();
  TextEditingController _incomeController = new TextEditingController();
  String _gender = "Female";
  String _ethnicity = "Malay";
  String _houseCategory = "Single (Public Transport User)";
  // TO ADD DATA IN THE USERDATA DATABASE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE7F6),
      appBar: AppBar(
        backgroundColor: Color(0xFF8E24AA),
        title: const Text('Add User Information', style: TextStyle(fontSize: 30)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image(image: null,),
              Text("NOTE : THIS IS FOR FIRST TIME ADDING USER INFORMATION", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
              const SizedBox(height: 50.0),
              TextFormField(
                textInputAction: TextInputAction.next,

                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Name field cannot be empty";
                  return null;
                },

                decoration: InputDecoration(

                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _ageController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Age field cannot be empty";
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: "Age",
                  labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30.0),
              // TextFormField(
              //   controller: _genderController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty)
              //       return "Gender field cannot be empty";
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     labelText: "Gender",
              //     labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              Text("Gender"),
              RadioListTile(
                title: const Text("Female"),
                value: "Female",
                groupValue: _gender,
                onChanged: (value){
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Male"),
                value: "Male",
                groupValue: _gender,
                onChanged: (value){
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              const SizedBox(height: 30.0),
              // TextFormField(
              //   controller: _ethnicityController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty)
              //       return "Ethnicity field cannot be empty";
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     labelText: "Ethnicity",
              //     labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              Text("Ethnicity"),
              RadioListTile(
                title: const Text("Malay"),
                value: "Malay",
                groupValue: _ethnicity,
                onChanged: (value){
                  setState(() {
                    _ethnicity = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Chinese"),
                value: "Chinese",
                groupValue: _ethnicity,
                onChanged: (value){
                  setState(() {
                    _ethnicity = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Indian"),
                value: "Indian",
                groupValue: _ethnicity,
                onChanged: (value){
                  setState(() {
                    _ethnicity = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Others"),
                value: "Others",
                groupValue: _ethnicity,
                onChanged: (value){
                  setState(() {
                    _ethnicity = value;
                  });
                },
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _phoneNoController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Phone no field cannot be empty";
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: "Phone No",
                  labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _locationController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Location field cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Location",
                  labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30.0),
              // TextFormField(
              //   controller: _houseCategoryController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty)
              //       return "House Category field cannot be empty";
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //     labelText: "House Category",
              //     labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              Text("Household Category"),
              RadioListTile(
                title: const Text("Single (Public Transport User)"),
                value: "Single (Public Transport User)",
                groupValue: _houseCategory,
                onChanged: (value){
                  setState(() {
                    _houseCategory = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Single (Car Owner)"),
                value: "Single (Car Owner)",
                groupValue: _houseCategory,
                onChanged: (value){
                  setState(() {
                    _houseCategory = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Married Couple (W/O children)"),
                value: "Married Couple (without children)",
                groupValue: _houseCategory,
                onChanged: (value){
                  setState(() {
                    _houseCategory = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Married Couple (with 1 child)"),
                value: "Married Couple (with 1 child)",
                groupValue: _houseCategory,
                onChanged: (value){
                  setState(() {
                    _houseCategory = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Married Couple (with 2 child)"),
                value: "Married Couple (with 2 child)",
                groupValue: _houseCategory,
                onChanged: (value){
                  setState(() {
                    _houseCategory = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Elderly Couple"),
                value: "Elderly Couple",
                groupValue: _houseCategory,
                onChanged: (value){
                  setState(() {
                    _houseCategory = value;
                  });
                },
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _shortController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Short term goal field cannot be empty";
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: "Short Term Goal",
                  labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _longController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Long term goal field cannot be empty";
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: "Long Term Goal",
                  labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _incomeController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Net Income field cannot be empty";
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: "Net Income",
                  labelStyle: TextStyle(color: Colors.black, fontSize:20.0),
                  border: OutlineInputBorder(),
                ),
              ),
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
                      UserProfile up = UserProfile(
                        name: _nameController.text,
                        age: int.parse(_ageController.text),
                        gender: _genderController.text,
                        ethnic: _ethnicityController.text,
                        phoneNo: _phoneNoController.text,
                        location: _locationController.text,
                        houseCategory: _houseCategoryController.text,
                        shortTarget: double.parse(_shortController.text),
                        longTarget: double.parse(_longController.text),
                        netIncome: double.parse(_incomeController.text),
                      );
                      await FirestoreService().addProfile(up);

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
