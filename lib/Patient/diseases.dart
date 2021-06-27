import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Disease extends StatefulWidget {
  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: false,
        title: Text(
          'Diseases',
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
                              image: AssetImage("images/asthma.jpg"),
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
                                  'ASTHMA',
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
                                  'Asthma is a long-term inflammatory disease of the airways of the lungs. '
                                  'It is characterized by variable and recurring symptoms, reversible airflow obstruction, and easily triggered bronchospasms.'
                                  'Symptoms include episodes of wheezing, coughing, and shortness of breath.',
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
                              image: AssetImage("images/coronavirus.jpg"),
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
                                  'CORONAVIRUS',
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
                                  "Coronaviruses vary significantly in risk factor. Some can kill more than 30% of those infected,"
                                  "such as MERS-CoV, and some are relatively harmless, such as the common cold."
                                  "Although the common cold is usually caused by rhinoviruses,"
                                  "in about 15% of cases the cause is a coronavirus.",
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
                              image: AssetImage("images/lung.jpg"),
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
                                  'LUNG CANCER',
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
                                  'Lung cancer, also known as lung carcinoma,'
                                  'is a malignant lung tumor characterized by uncontrolled cell growth in tissues of the lung.'
                                  'The most common symptoms are coughing, weight loss, shortness of breath, and chest pains.',
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
                              image: AssetImage("images/Kidney-Stone.jpg"),
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
                                  'KIDNEY STONE',
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
                                  "Kidney stone disease, also known as nephrolithiasis or urolithiasis,"
                                  " is when a solid piece of material develops in the urinary tract."
                                  "Kidney stones typically form in the kidney and leave the body in the urine stream."
                                  "A small stone may pass without causing symptoms.",
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
                              image: AssetImage("images/blood.jpg"),
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
                                  'BLOOD VESSEL DISORDERS',
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
                                  'Blood vessel disorder generally refers to the narrowing, hardening or enlargement of arteries and veins.'
                                  'It is often due to the build-up of fatty deposits in the lumen of blood vessels or infection of the vessel wall. ',
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
