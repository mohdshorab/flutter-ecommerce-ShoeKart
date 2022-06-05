import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/services/authentication_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthenticationServiceController extends GetxController {
  
// Getting firebaseAuth instance in authservice
  AuthenticationService authService =
      AuthenticationService(FirebaseAuth.instance);

// firebaseFirestore instance
  var firebaseFirestore = FirebaseFirestore.instance;

// Register new user
  Future<String> registerUser(
      String email, String password, fname, lname, phone, address) async {
    var result = await authService
        .signUp(email: email, password: password)
        // postDetailsToFirestore helps to store other details of user in Fb DB
        .then((value) => authService.postDetailsToFirestore(fname, lname, phone, address));
    debugPrint('user added'); 
    Fluttertoast.showToast(msg: 'User Added Successfully');
    return '';
  }

// signOut the User
  Future<void> signOutUser() async {
    await authService.signOut();
    Fluttertoast.showToast(msg: 'Logged out successfully');
  }

// Validate the user
  Future<String> validateUser(String email, String pwd) async {
    var result = await authService.signIn(email: email, password: pwd);
    debugPrint(result);
    return result;
  }

  // get UID of current user
  Future<String> currentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  Future<UserModel?> readUser(user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(user!.uid);
// using docUser to get a single document or snapshot back by using get() method
final snapshot = await docUser.get();
if(snapshot.exists){
  return UserModel.fromMap(snapshot.data()!);
}
  }




}
