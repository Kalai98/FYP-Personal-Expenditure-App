
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String id;
  final String name; // Name
  final int age;
  final String gender;
  final String ethnic; //Ethnicity
  final String phoneNo;
  final String location;
  final String houseCategory; // Household Category
  final double shortTarget; //short term target
  final double longTarget; // long term target
  final double netIncome; // net disposable income input
//For USER PROFILE PAGE
  UserProfile({this.id,this.name, this.age, this.gender, this.ethnic, this.phoneNo,
    this.location, this.houseCategory,
    this.shortTarget, this.longTarget, this.netIncome});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender' : gender,
      'ethnic' : ethnic,
      'phoneNo' : phoneNo,
      'location' : location,
      'houseCategory' : houseCategory,
      'shortTarget' : shortTarget,
      'longTarget' : longTarget,
      'netIncome' : netIncome,
    };
  }
  UserProfile.fromSnapshot (DocumentSnapshot snapshot):

        name = snapshot['name'],
        age = snapshot['age'],
        gender = snapshot['gender'],
        ethnic = snapshot['ethnic'],
        phoneNo = snapshot['phoneNo'],
        location = snapshot['location'],
        houseCategory = snapshot['houseCategory'],
        shortTarget = snapshot['shortTarget'],
        longTarget = snapshot['longTarget'],
        netIncome = snapshot['netIncome'],
        id = snapshot.documentID;

}