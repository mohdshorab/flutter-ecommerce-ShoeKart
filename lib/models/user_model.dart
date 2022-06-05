import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid, email, fname, lname, phone, address;

  UserModel({
    this.uid,
    this.fname,
    this.email,
    this.lname,
    this.phone,
    this.address
  });

// taking data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fname: map['fname'],
      lname: map['lname'],
      phone: map['phone'],
      address: map['address']
    );
  }
// sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fname': fname,
      'lname': lname,
      'phone' : phone,
      'address' : address
    };
  }



 


}
