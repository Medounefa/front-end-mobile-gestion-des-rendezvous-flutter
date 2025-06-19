import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-patient-pour-secretaire/ajoutPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-patient-pour-secretaire/detailsPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class listePatientPourSecretaire extends StatefulWidget {
  const listePatientPourSecretaire({super.key});

  @override
  State<listePatientPourSecretaire> createState() =>
      _listePatientPourSecretaireState();
}

class _listePatientPourSecretaireState
    extends State<listePatientPourSecretaire> {
  final List<String> patients = [
    'Medoune Fall',
    ' Fatoumata traore',
    ' Mariete Dieng'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Color(0xFF0CFAFA),
        toolbarHeight: 100,
        title: Text(
          "Liste de \npatients",
        ),
        actions: [
          Row(
            children: [
              Container(
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 40,
                    ),
                    Positioned(
                      top: 2,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 10,
                ),
                child: ClipOval(
                  child: UserMenu(),
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Recherche un patient",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.search),
                      style: ElevatedButton.styleFrom(
                        // maximumSize: Size(150, 50),
                        backgroundColor: Color(0xFF0CFAFA),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: 328,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 121, 117, 117),
                                      width: 0.2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          offset: Offset(0, 3))
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      (context),
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              detailsPatient()),
                                                    );
                                                  },
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .skip(1)
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .skip(2)
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .skip(1)
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .skip(2)
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .skip(1)
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .skip(2)
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .skip(1)
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: patients
                                                      .skip(2)
                                                      .take(1)
                                                      .map((patient) =>
                                                          Container(
                                                            child: Text(
                                                              patient,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 160, 235, 235),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 2,
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ]),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                shadowColor: Colors.black
                                                    .withOpacity(0.1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  (context),
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ajoutPatient()),
                                                );
                                              },
                                              child: Text("Ajouter"),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
