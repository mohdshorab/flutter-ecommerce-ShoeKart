import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authenticationService_controller.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../screens/Contact Us/contactUs.dart';
import '../screens/Login-Register/log_in_screen.dart';
import '../screens/privacy_screen.dart';
import '../screens/profile Page/screen/profile.dart';

class CreateDrawer extends StatefulWidget {
  const CreateDrawer({Key? key}) : super(key: key);

  @override
  State<CreateDrawer> createState() => _CreateDrawerState();
}

class _CreateDrawerState extends State<CreateDrawer> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  final controller = Get.put(AuthenticationServiceController());

  @override
  Widget build(BuildContext context) {
    // using future controller 
    return FutureBuilder<UserModel?>(
      future: controller.readUser(currentUser),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text('Something Went Wrong!');
        } else
        if(snapshot.hasData){
          final user = snapshot.data;
          return Drawer(
            child: ListView(
              children: [
                user==null ? const Center(child: Text('No User Found'),) : buildUser(user),
                ListTile(
                  onTap: () {
                    Get.to(ProfilePage());
                  },
                  leading: const Icon(Icons.person),
                  title: const Text("My Profile"),
                ),
                ListTile(
                  onTap: () {
                    Get.to(const ContactUs());
                  },
                  leading: const Icon(Icons.contact_mail),
                  title: const Text("Contact Us"),
                ),
                ListTile(
                  onTap: () {
                    Get.to(const PrivacyScreen());
                  },
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text("Privacy & Policy"),
                ),
                ListTile(
                  onTap: () {
                    controller.signOutUser();
                    Get.off(const LogInScreen());
                  },
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text("Log out"),
                ),

                const Center(
                    child: Center(
                      child: Text(
                  'Version 1.0.0',
                  style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                    ))

              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }  
      );

  }


  Widget buildUser(UserModel user) => Card(
    child: Column(
      children: [
        const SizedBox(
               height: 150,
               width: 150,
               child: CircleAvatar(
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'),
          ),
             ),
        ListTile(
          title: Text(user.lname.toString()),
          subtitle: Text(user.email.toString()),
        ),
      ],
    ),
  );
  }