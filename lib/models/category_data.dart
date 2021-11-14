import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final double budget;
  final double expenses;
  final String type;
  final String id;
  final DateTime date;


  Category({this.budget, this.expenses, this.id,this.date,this.type});
//To save to the DATABASE
  Map<String, dynamic> toMap() {
    return {
      "Budget" : budget,
      "Expenses":expenses,
      "Date" :date,
      "Type" : type,

    };
  }
  // TO GET DATA FROM DATABASE
  Category.fromSnapshot (DocumentSnapshot snapshot):
        budget = snapshot['Budget'],
        date = snapshot['Date'].toDate(),
        expenses = snapshot['Expenses'],
        type = snapshot['Type'],
        id = snapshot.documentID;
}