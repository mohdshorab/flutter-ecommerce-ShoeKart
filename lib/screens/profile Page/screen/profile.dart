import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authenticationService_controller.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:get/get.dart';


class ProfilePage extends StatelessWidget {
    final controller = Get.put(AuthenticationServiceController());
   User? currentUser = FirebaseAuth.instance.currentUser;
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('My Account', style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder<UserModel?>(
      future: controller.readUser(currentUser),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text('Something Went Wrong!');
        } else
        if(snapshot.hasData){
          final user = snapshot.data;
          return ListView(
              children: [
                

                user==null ? const Center(child: Text('No User Found'),) : Card(
       elevation: 30,
       shadowColor: Colors.red,
       child:
       Column(
         children:  [
           const Center(
             child: SizedBox(
               height: 150,
               width: 150,
               child: CircleAvatar(
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'),
          ),
             ),
           ),
          const SizedBox(height: 25,),
          Card(
            elevation: 0,
            shadowColor: Colors.red,
            child: SizedBox(
              width: double.infinity,
              child: Center(child: Expanded(child: Text(user.fname.toString(), style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 34),))))),
          const SizedBox(height: 25,),
          Center(
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Text('Full Name : ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    title: Text('${user.fname.toString()} ${user.lname.toString()} ', style: const TextStyle( fontWeight: FontWeight.bold, ), textAlign: TextAlign.center,),
                  ),
                  ListTile(
                    leading: const Text('E Mail : ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                    title: Text(user.email.toString(), style: const TextStyle( fontWeight: FontWeight.bold,)),
                  )  ,
                  ListTile(
                    leading: const Text('Phone : ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    title: Text(user.phone.toString(), style: const TextStyle( fontWeight: FontWeight.bold,)),
                  ),
                  ListTile(
                    leading: const Text('Address : ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    title: Text(user.address.toString(), style: const TextStyle( fontWeight: FontWeight.bold,)),
                  ),
                                  
                ],
              ),
            ),
          )
           


         ],
       ) ,)
       
       
              ]
          );
  }
  else {
          return const Center(child: CircularProgressIndicator(),);
        }
  
  }
  ),
    );
    }
    //  Widget buildUser(UserModel user) => 
}
