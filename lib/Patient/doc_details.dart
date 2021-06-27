import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital_management_app/Admin/admin_home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DocDetails extends StatefulWidget {
  @override
  DocDetailsState createState() => DocDetailsState();
}

class DocDetailsState extends State<DocDetails>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  List cardiolist = [];
  List gynoList = [];
  List opthallist = [];
  List dermalist = [];
  List hemalist = [];
  List dentistlist = [];
  List radiolist = [];
  List maternitylist = [];
  List gaslist = [];
  List pulmlist = [];
  List psycholist = [];

  bool isLoading = false;

  fetchCardio() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/cardiologylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        cardiolist = items;
        isLoading = false;
      });
    } else {
      cardiolist = [];
      isLoading = false;
    }
  }

  fetchOpthal() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/opthalmologylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        opthallist = items;
        isLoading = false;
      });
    } else {
      opthallist = [];
      isLoading = false;
    }
  }

  fetchHema() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/hematologylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        hemalist = items;
        isLoading = false;
      });
    } else {
      hemalist = [];
      isLoading = false;
    }
  }

  fetchGyno() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/gynecologylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        gynoList = items;
        isLoading = false;
      });
    } else {
      gynoList = [];
      isLoading = false;
    }
  }

  fetchRadio() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/radiologylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        radiolist = items;
        isLoading = false;
      });
    } else {
      radiolist = [];
      isLoading = false;
    }
  }

  fetchMaternity() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/maternitylogylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        maternitylist = items;
        isLoading = false;
      });
    } else {
      maternitylist = [];
      isLoading = false;
    }
  }

  fetchPsychi() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/psychiatrylogylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        psycholist = items;
        isLoading = false;
      });
    } else {
      psycholist = [];
      isLoading = false;
    }
  }

  fetchDentist() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/dentistlist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        dentistlist = items;
        isLoading = false;
      });
    } else {
      dentistlist = [];
      isLoading = false;
    }
  }

  fetchDerma() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/dermatologylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        dermalist = items;
        isLoading = false;
      });
    } else {
      dermalist = [];
      isLoading = false;
    }
  }

  fetchGas() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/gastroenterologylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        gaslist = items;
        isLoading = false;
      });
    } else {
      gaslist = [];
      isLoading = false;
    }
  }

  fetchPulm() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/pulmonologylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        pulmlist = items;
        isLoading = false;
      });
    } else {
      pulmlist = [];
      isLoading = false;
    }
  }

  void initState() {
    super.initState();
    this.fetchCardio();
    this.fetchGyno();
    this.fetchDentist();
    this.fetchDerma();
    this.fetchGas();
    this.fetchHema();
    this.fetchMaternity();
    this.fetchOpthal();
    this.fetchPsychi();
    this.fetchPulm();
    this.fetchRadio();
    controller = new TabController(vsync: this, length: 11, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 130.0,
        centerTitle: true,
        title: Text(
          'Doctors ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 21.0,
            fontFamily: 'Kumbh Sans',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: controller,
          labelColor: Colors.black,
          indicatorColor: Color(0xFF265ED7),
          indicatorWeight: 3.0,
          unselectedLabelColor: Colors.grey.shade400,
          isScrollable: true,
          tabs: [
            Tab(
              text: ('Cardiologist'),
            ),
            Tab(
              text: 'Ophthalmology',
            ),
            Tab(
              text: 'Hematology',
            ),
            Tab(
              text: 'Gynecology',
            ),
            Tab(
              text: ('Radiology'),
            ),
            Tab(
              text: ('Maternity'),
            ),
            Tab(
              text: ('Psychiatric'),
            ),
            Tab(
              text: ('Dentistry'),
            ),
            Tab(
              text: ('Dermatology'),
            ),
            Tab(
              text: ('Gastroenterology'),
            ),
            Tab(
              text: ('Pulmonology'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: cardiolistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: opthallistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: HemalistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: gynolistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: RadiolistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: maternitylistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: psycholistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: dentistlistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: dermalistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: gaslistBody(),
            ),
          ),
          InkWell(
            onTap: null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: pulmlistBody(),
            ),
          ),
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    print("working");
  }

  Widget cardiolistBody() {
    if (cardiolist.contains(null) || cardiolist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: cardiolist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(cardiolist[index]);
        });
  }

  Widget cardioCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget gynolistBody() {
    if (gynoList.contains(null) || gynoList.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: gynoList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(gynoList[index]);
        });
  }

  Widget gynoCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dentistlistBody() {
    if (dentistlist.contains(null) || dentistlist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: dentistlist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(dentistlist[index]);
        });
  }

  Widget dentistcard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget RadiolistBody() {
    if (radiolist.contains(null) || radiolist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: radiolist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(radiolist[index]);
        });
  }

  Widget RadioCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget psycholistBody() {
    if (psycholist.contains(null) || psycholist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: psycholist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(psycholist[index]);
        });
  }

  Widget psychoCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget pulmlistBody() {
    if (pulmlist.contains(null) || pulmlist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: pulmlist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(pulmlist[index]);
        });
  }

  Widget pulmCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget HemalistBody() {
    if (hemalist.contains(null) || hemalist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: hemalist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(hemalist[index]);
        });
  }

  Widget HemaCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget maternitylistBody() {
    if (maternitylist.contains(null) || maternitylist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: maternitylist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(maternitylist[index]);
        });
  }

  Widget maternityCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dermalistBody() {
    if (dermalist.contains(null) || dermalist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: dermalist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(dermalist[index]);
        });
  }

  Widget dermaCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget gaslistBody() {
    if (gaslist.contains(null) || gaslist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: gaslist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(gaslist[index]);
        });
  }

  Widget gasCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      )
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget opthallistBody() {
    if (opthallist.contains(null) || opthallist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: opthallist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return cardioCard(opthallist[index]);
        });
  }

  Widget opthalCard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Kumbh Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 38.0,
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      designation,
                      style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 12.0,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Icon(
                                FontAwesomeIcons.solidStar,
                                size: 12.0,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              reviews,
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.8,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.8),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 12.0,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '1st Shift',
                              style: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                  fontSize: 11.6,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
