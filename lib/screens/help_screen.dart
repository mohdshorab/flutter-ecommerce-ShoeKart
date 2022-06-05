import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Login-Register/log_in_screen.dart';

class Help extends StatelessWidget {
  static const String routeName = '/Help';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.help_center, color: Colors.white),
          backgroundColor: Colors.red,
          title: const Text(
            "How to use ?",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:20.0, left: 12, right: 12),
            child: Column(
              children:  [
                Text(
                  """ShoeKart is a go-to platform, it's sneakers app where it employs a few different
methods to enable everyday sneaker lovers greater access to its shoes.

Before we go any further, it should be noted that at least in the United States, 
ShoeKart has successfully shut down bots ability to succeed on the site.

This tutorial is designed to help first-time India-based sneaker lovers who are
attempting to cop a shoe via a ShoeKart, but have no idea how either works. ShoeKart is
used to sell Nike, Puma, Adidas and shoes from more brands and more recently apparel, but sub-brands of brands like Nike brands Converse and Jordan.""",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Column(
                    children: const [
                      Text('Please follow the these steps : ', style: TextStyle(fontSize: 20),),
                      Card(
                    color: Colors.red,
                    shadowColor: Colors.red,
                    elevation: 30,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '''
1. Login your account(If new user, create a new ).
2. Select your favourite shoe.
3. Add it to cart.
4. Buy it.
                  ''',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),

                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Continue to',),
                        TextButton(onPressed: (){
                          Get
                          .to(const LogInScreen());
                        }, child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
