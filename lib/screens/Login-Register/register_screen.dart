import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login-Register/log_in_screen.dart';
import 'package:get/get.dart';
import '../../controllers/authenticationService_controller.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  AuthenticationServiceController controller =
      Get.put(AuthenticationServiceController());

  final _formKey = GlobalKey<FormState>();

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final pwdController = TextEditingController();
  final confirmPwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                // top: Radius.circular(5),
                bottom: Radius.circular(7))),
        title: const Text(
          'Hey user, Register Yourself',
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
                        height: 100,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      createTextField(
                          fnameController,
                          TextInputType.text,
                          Icons.person,
                          'First Name',
                          false,
                          'first name can\'t be empty'),
                      const SizedBox(
                        height: 10,
                      ),
                      createTextField(
                          lnameController,
                          TextInputType.text,
                          Icons.person,
                          'Last Name',
                          false,
                          'last name can\'t be empty'),
                      const SizedBox(
                        height: 10,
                      ),
                      createTextField(
                          phoneController,
                          TextInputType.text,
                          Icons.phone,
                          'phone',
                          false,
                          'Phone can\'t be empty'),
                           const SizedBox(
                        height: 10,
                      ),
                      createTextField(
                          emailController,
                          TextInputType.emailAddress,
                          Icons.mail,
                          'E-mail',
                          false,
                          'email can\'t be empty'),
                      const SizedBox(
                        height: 10,
                      ),
                      createTextField(
                          addressController,
                          TextInputType.text,
                          Icons.location_history,
                          'Address',
                          false,
                          'Address can\'t be empty'),
                           const SizedBox(
                        height: 10,
                      ),
                      createTextField(
                          pwdController,
                          TextInputType.text,
                          Icons.vpn_key,
                          'password',
                          true,
                          'Password can\'t be empty'),
                      const SizedBox(
                        height: 10,
                      ),
                      createTextField(
                          confirmPwdController,
                          TextInputType.text,
                          Icons.vpn_key,
                          'Confirm Password',
                          false,
                          'this can\'t be empty'),
                      const SizedBox(height: 10),
                      Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.redAccent,
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width - 160,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller
                                  .registerUser(
                                      emailController.text,
                                      pwdController.text,
                                      fnameController,
                                      lnameController,
                                      phoneController,
                                      addressController
                                      )
                                  .then((_) => {
                                        Get.off(const LogInScreen()),
                                        reset(),
                                      });
                            }
                          },
                          child: const Text(
                            'Register',
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
                    ],
                  )),
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
