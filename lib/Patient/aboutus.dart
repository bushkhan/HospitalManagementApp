import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  @override
  AboutusState createState() => AboutusState();
}

class AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: true,
        title: Text(
          'About Us',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Kumbh Sans',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "CARE & CURE HOSPITAL",
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Kumbh Sans',
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  'For millions of people,Our Hospital App is a trusted home for health.',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.5,
                      fontFamily: 'Kumbh Sans-Regular',
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  'It connects them with everything they need to take good'
                  ' care of themselves and their loved ones-finding the right doctor, '
                  'booking appointments, storing health records or'
                  ' learning new ways to live healthier.',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.5,
                      fontFamily: 'Kumbh Sans-Regular',
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
