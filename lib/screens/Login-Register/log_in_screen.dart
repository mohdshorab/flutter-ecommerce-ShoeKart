import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Landing%20Page/Screen/landing_page.dart';
import 'package:flutter_application_1/screens/Login-Register/register_screen.dart';
import 'package:flutter_application_1/screens/help_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../controllers/authenticationService_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  AuthenticationServiceController controller =
      Get.put(AuthenticationServiceController());

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.shoePrints),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(7))),
        title: const Text(
          'Hey Welcome to ShoeKart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5), BlendMode.dstATop),
          image: const NetworkImage(
              'https://images.unsplash.com/photo-1604868189265-219ba7bf7ea3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      createTextField(
                        emailController,
                        TextInputType.emailAddress,
                        Icons.mail,
                        'E-mail',
                        false,
                        'Email Can\'t be empty.',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      createTextField(
                        pwdController,
                        TextInputType.text,
                        Icons.vpn_key,
                        'password',
                        true,
                        'Password can\'t be empty',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.redAccent,
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width - 160,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await (controller
                                  .validateUser(
                                emailController.text.trim(),
                                pwdController.text.trim(),
                              )
                                  .then((result) {
                                if (result == '') {
                                  Get.off(LandingPage());
                                }
                              }));
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      'Email and Password both are mandatory.');
                            }
                          },
                          child: const Text(
                            'Log In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account ? ',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Card(
                            elevation: 20,
                            color: Colors.black.withOpacity(0.4),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(const RegisterationScreen());
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                         
                        ],
                      ),
                       Padding(
                         padding: const EdgeInsets.only(top: 250.0),
                         child: Column(
                              children: [
                                const Text('Learn, How to use ShoeKart ?'),
                                Card(
                                  elevation: 10,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent)
                                    ),
                                    onPressed: (){
                                    Get.to(Help());
                                  }, child: const Text('Click Here')),
                                ),
                              ],
                            ),
                       )
                    ],
                  ),
                  
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createTextField(TextEditingController controller, keyboardType,
      IconData icon, String htxt, passornot, returnNullText) {
    return TextFormField(
      obscureText: passornot,
      autofocus: false,
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return returnNullText;
        } else {
          return null;
        }
      },
      onSaved: (value) {
        controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        icon: Icon(icon),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: htxt,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  reset() {
    emailController.text = '';
    pwdController.text = '';
  }
}
