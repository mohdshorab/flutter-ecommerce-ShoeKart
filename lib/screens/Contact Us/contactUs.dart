import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool showCartIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 40.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'CONTACT',
              style: TextStyle(fontSize: 15.0, letterSpacing: 1.0),
            ),
          ),
          SizedBox(height: 10.0),
          Material(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Our address',
                style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '1412 Steiner Street, Delhi, India, 110087',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: ListTile(
              leading: Text(
                'E-mail us',
                style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                'office@shoekart.com',
                style: TextStyle(fontSize: 20.0, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10.0),
            child: Text('Our business hour are Mon - Fri, 10am - 6pm, IST'),
          ),
          SizedBox(height: 20.0),
          Material(
            color: Colors.white,
            child: ListTile(
              title: Center(
                child: Text(
                  'Call Us',
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
