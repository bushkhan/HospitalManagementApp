import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Laboratory extends StatefulWidget {
  @override
  _LaboratoryState createState() => _LaboratoryState();
}

class _LaboratoryState extends State<Laboratory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: true,
        title: Text(
          'Laboratory',
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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 10),
                          //width: 375,
                          child: ClipRRect(
                            child: Image(
                              image: AssetImage("images/icu.jpg"),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'ICU',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontFamily: 'Kumbh Sans',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Text(
                                  'Intensive care units cater to patients with severe or life-threatening illnesses and injuries, which require constant care,'
                                  ' close supervision from life support equipment and medication in order to ensure normal bodily functions',
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 20),
                          child: ClipRRect(
                            child: Image(
                              image: AssetImage("images/opthamology.jpg"),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'OPHTHALMOLOGY',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontFamily: 'Kumbh Sans',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Text(
                                  "Ophthalmology is a branch of medicine and surgery that deals with the diagnosis and treatment of disorders of the eye."
                                  "Eye surgery, also known as ocular surgery, is surgery performed on the eye or its adnexa by an ophthalmologist.",
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 10),
                          child: ClipRRect(
                            child: Image(
                              image: AssetImage("images/GENERAL.jpg"),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'GENERAL',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontFamily: 'Kumbh Sans',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Text(
                                  'The best-known type of room in the hospital is the general room.'
                                  'These facilities handle many kinds of disease and injury, and normally have an emergency department'
                                  'or trauma center to deal with immediate and urgent threats to health.',
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 10),
                          child: ClipRRect(
                            child: Image(
                              image: AssetImage("images/surgical.png"),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'SURGERY',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontFamily: 'Kumbh Sans',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Text(
                                  'Surgery is a medical or dental specialty that uses operative manual and instrumental techniques'
                                  ' on a person to investigate or treat a pathological condition such as a disease or injury,'
                                  ' to help improve bodily function, appearance, or to repair unwanted ruptured areas.',
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 10),
                          child: ClipRRect(
                            child: Image(
                              image: AssetImage("images/dental.jpg"),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'DENTAL',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontFamily: 'Kumbh Sans',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Text(
                                  'Dentistry, also known as dental medicine and oral medicine, is a branch of medicine that '
                                  'consists of the study, diagnosis, prevention, and treatment of diseases, disorders, and conditions of the oral cavity.',
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // ],
    // ),
    // );
  }
}
