import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:hospital_management_app/Admin/dentistlist.dart';
import 'package:hospital_management_app/Admin/dermatologylist.dart';
import 'package:hospital_management_app/Admin/doctor_details.dart';
import 'package:hospital_management_app/Admin/gastroenterologylist.dart';
import 'package:hospital_management_app/Admin/gynecologylist.dart';
import 'package:hospital_management_app/Admin/hematologylist.dart';
import 'package:hospital_management_app/Admin/maternitylist.dart';
import 'package:hospital_management_app/Admin/ophthalmologylist.dart';
import 'package:hospital_management_app/Admin/psychiatrylist.dart';
import 'package:hospital_management_app/Admin/pulmonologylist.dart';
import 'package:hospital_management_app/Admin/radiologylist.dart';
import 'diseases.dart';
import 'file:///C:/Users/Bushra%20Khan/AndroidStudioProjects/hospital_management_app/lib/Admin/cardiologylist.dart';
import 'package:hospital_management_app/Patient/hospital_details.dart';
import 'package:hive/hive.dart';
import 'package:hospital_management_app/Patient/numbers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List imgList = [
    'images/doctor.jpg',
    'images/sliderimage2.jpg',
  ];
  Box dataBox;
  var name;
  void initState() {
    // TODO: implement initState
    super.initState();

    dataBox = Hive.box("logindata");
    name = dataBox.get('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Hello, ',
                    style: TextStyle(
                        fontSize: 21.0,
                        fontFamily: 'Kumbh Sans',
                        color: Colors.grey.shade900),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 21.0,
                        fontFamily: 'Kumbh Sans',
                        color: Colors.grey.shade900),
                  ),
                ],
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.search,
                size: 28.0,
                color: Colors.grey.shade900,
              ),
            ),
          ],
        ),
        body: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            cacheExtent: 400.0 * 7,
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 14.0,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 4,
                  enlargeCenterPage: true,
                ),
                items: imgList.map((imgAsset) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            imgAsset,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontFamily: 'Kumbh Sans',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontFamily: 'Kumbh Sans',
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    height: 115.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CardiologyList();
                              }));
                            });
                          },
                          child: Categories(
                              img: 'images/heart.png', text: "Cardiology"),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return OpthalmologyList();
                                }));
                              });
                            },
                            child: Categories(
                                img: 'images/eye.png', text: "Ophthalmology")),
                        InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HematologyList();
                                }));
                              });
                            },
                            child: Categories(
                                img: 'images/blood.png', text: "Hematology")),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return GynecologyList();
                              }));
                            });
                          },
                          child: Categories(
                              img: 'images/female.png', text: "Gynecology"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RadiologyList();
                              }));
                            });
                          },
                          child: Categories(
                              img: 'images/bone.png', text: "Radiology"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MaternityList();
                              }));
                            });
                          },
                          child: Categories(
                              img: 'images/mother.png', text: "Maternity"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    height: 115.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PsychiatryList();
                              }));
                            });
                          },
                          child: Categories(
                              img: 'images/brain.png', text: "Psychiatric"),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DentistList();
                                }));
                              });
                            },
                            child: Categories(
                                img: 'images/teeth.png', text: "Dentistry")),
                        InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DermatologyList();
                                }));
                              });
                            },
                            child: Categories(
                                img: 'images/hair.png', text: "Dermatology")),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return GastroenterologyList();
                              }));
                            });
                          },
                          child: Categories(
                              img: 'images/salad.png',
                              text: "Gastronterology "),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PulmonologyList();
                              }));
                            });
                          },
                          child: Categories(
                              img: 'images/lungs.png', text: "Pulmonology"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available Doctors',
                      style: TextStyle(
                        fontFamily: 'Kumbh Sans',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorDetails(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        width: 300,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Serena Gome',
                                        style: TextStyle(
                                            fontFamily: 'Kumbh Sans',
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Cardiologist',
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontFamily: 'Kumbh Sans',
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16.0,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'Experience',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Kumbh Sans',
                                        ),
                                      ),
                                      Text('4 Years'),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'Patients',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Kumbh Sans',
                                        ),
                                      ),
                                      Text(
                                        '4.01K',
                                        style: TextStyle(fontSize: 12.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(10),
                                child: Image.asset(
                                  'images/d1.png',
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        width: 300,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Meri Mo. Hayden',
                                        style: TextStyle(
                                            fontFamily: 'Kumbh Sans',
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Pulmonogy',
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontFamily: 'Kumbh Sans',
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16.0,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'Experience',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Kumbh Sans',
                                        ),
                                      ),
                                      Text('5 Years'),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'Patients',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Kumbh Sans',
                                        ),
                                      ),
                                      Text(
                                        '2.01K',
                                        style: TextStyle(fontSize: 12.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(10),
                                child: Image.asset(
                                  'images/pulmonologydoc.png',
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        width: 300,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Patrick Greece',
                                        style: TextStyle(
                                            fontFamily: 'Kumbh Sans',
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Radiologist',
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontFamily: 'Kumbh Sans',
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16.0,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'Experience',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Kumbh Sans',
                                        ),
                                      ),
                                      Text('8 Years'),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'Patients',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Kumbh Sans',
                                        ),
                                      ),
                                      Text(
                                        '6.01K',
                                        style: TextStyle(fontSize: 12.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(10),
                                child: Image.asset(
                                  'images/radiologydoc.png',
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                child: Row(
                  children: [
                    Text(
                      'Find Your Medical Solution!',
                      style: TextStyle(
                        fontFamily: 'Kumbh Sans',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorDetails(),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Options(
                                      img: 'images/d11.png', text: 'Doctors'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Laboratory(),
                                      ),
                                    );
                                  },
                                  child: Options(
                                      img: 'images/hospital10.png',
                                      text: 'Hospital'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Disease(),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Options(
                                      img: 'images/disesase10.png',
                                      text: 'Diseases'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Calling_List(),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Options(
                                      img: 'images/ambulnace10.png',
                                      text: 'Ambulance'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  child: Options(
                                      img: 'images/consultation.png',
                                      text: 'Consultation'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  child: Options(
                                      img: 'images/pill.png', text: 'Pharmacy'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

class Categories extends StatelessWidget {
  @override
  final img;
  final text;

  const Categories({Key key, @required this.img, @required this.text})
      : super(key: key);
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(img);
    return Container(
      width: 120.0,
      margin: EdgeInsets.only(right: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: Image(
                    image: assetImage,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                  fontFamily: 'Kumbh Sans',
                ),
              ),
            ),
            Divider(
              thickness: 0,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  @override
  final img;
  final text;
  const Options({Key key, @required this.img, @required this.text})
      : super(key: key);
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(img);
    return Container(
      height: 130.0,
      width: 100.0,
      margin: EdgeInsets.only(right: 10.0, left: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Image(image: assetImage),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  '$text',
                  style: TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontSize: 14.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
