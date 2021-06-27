import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'doctor_constants.dart';

class PaymentDetails extends StatefulWidget {
  @override
  PaymentDetailsState createState() => PaymentDetailsState();
}

class PaymentDetailsState extends State<PaymentDetails> {
  List payment = [];
  bool isLoading = false;
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/paymentdetails.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        payment = items;
        isLoading = false;
      });
    } else {
      payment = [];
      isLoading = false;
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: true,
        title: Text(
          'Payment Details',
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
      body: listBody(),
    );
  }

  void choiceAction(String choice) {
    print("working");
  }

  Widget listBody() {
    return ListView.builder(
        itemCount: payment.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return patientCard(payment[index]);
        });
  }

  Widget patientCard(item) {
    var patient = item['patient_name'];
    var doctor = item['doctor_name'];
    var payment = item['payment'];
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Patient',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Kumbh Sans'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Doctor',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Kumbh Sans'),
                    ),
                  ),
                  SizedBox(
                    width: 28.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Payment',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Kumbh Sans'),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  PopupMenuButton<String>(
                    onSelected: choiceAction,
                    itemBuilder: (BuildContext context) {
                      return Constants.choices.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(
                            choice,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: 'Kumbh Sans'),
                          ),
                        );
                      }).toList();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              DottedLine(
                dashColor: Colors.grey.shade900,
                lineThickness: 0.5,
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    patient,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.5,
                      fontFamily: 'Kumbh Sans-Regular',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        doctor,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.5,
                          fontFamily: 'Kumbh Sans-Regular',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 65.0),
                    child: Text(
                      payment,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.5,
                          fontFamily: 'Kumbh Sans-Regular',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
