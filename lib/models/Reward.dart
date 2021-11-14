
import 'package:cloud_firestore/cloud_firestore.dart';

class Reward {
  String code;
  String id;

  Reward(this.code, this.id);

  Reward.fromSnapshot (DocumentSnapshot snapshot):
        code = snapshot['code'],
        id = snapshot.documentID;
}