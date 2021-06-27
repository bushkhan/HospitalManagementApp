import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'my_appointment_page.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  Box dataBox;
  var name;

  List doctorupcoming = [];
  bool isLoading = false;
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/payment.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        doctorupcoming = items;
        isLoading = false;
      });
    } else {
      doctorupcoming = [];
      isLoading = false;
    }
  }

  @override
  void initState() {
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);

    // TODO: implement initState
    super.initState();

    dataBox = Hive.box("logindata");
    name = dataBox.get('name');
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_UYipBj0yBj4DMB",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Hospital",
      "description": "Payment",
      "prefill": {
        "contact": "7039430079",
        "email": "bushrakhan2212002@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print('Payment Successfull');
    Toast.show('Payment Successfull', context);
  }

  void handlerPaymentError() {
    print('Payment Error');
    Toast.show('Payment Error', context);
  }

  void handlerExternalWallet() {
    print('External Wallet');
    Toast.show('External Wallet', context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Razor Pay',
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
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25.0),
            Text(
              'Enter Amount 500Rs/_',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Kumbh Sans',
                  fontSize: 16.0),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                // color: Color(0xFFEFF3F6),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(1, 2),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: TextFormField(
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "500",
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(fontFamily: 'Kumbh Sans', fontSize: 16.0))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 0, bottom: 0, left: 15.0, right: 15.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 5.0,
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: Color(0xFF265ED7),
                onPressed: () {
                  openCheckout();
                  fetchUser();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyAppointmentPage(),
                    ),
                  );
                },
                child: Text(
                  'Pay Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Kumbh Sans',
                      fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
