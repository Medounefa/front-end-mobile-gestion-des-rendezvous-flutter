import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-patients/AjouterUnPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-patients/detailsDuPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-patient-pour-secretaire/ajoutPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-patient-pour-secretaire/detailsPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class listeDesPatients extends StatefulWidget {
  const listeDesPatients({super.key});

  @override
  State<listeDesPatients> createState() => _listeDesPatientsState();
}

class _listeDesPatientsState extends State<listeDesPatients> {
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
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF), // icône burger noir
        ),
        backgroundColor: Color(0xFF007BFF),
        toolbarHeight: 100,
        title: Text(
          "Liste de \npatients",
          style: TextStyle(color: Color(0xFFFFFFFF)),
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
                      color: Color(0xFF2196F3),
                    ),
                    Positioned(
                      top: 2,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB74D),
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
                      child: Icon(
                        Icons.search,
                        color: Color(0xFFFFFFFF),
                      ),
                      style: ElevatedButton.styleFrom(
                        // maximumSize: Size(150, 50),
                        backgroundColor: Color(0xFF4CAF50),
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
                                                    color: Color(0xFF4CAF50),
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
                                                              detailsDuPatient()),
                                                    );
                                                  },
                                                  child: Text(
                                                    "voir",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    color: Color(0xFF4CAF50),
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
                                                        color:
                                                            Color(0xFFFFFFFF),
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
                                                    Color(0xFF4CAF50),
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
                                                          ajouterUnPatient()),
                                                );
                                              },
                                              child: Text(
                                                "Ajouter",
                                                style: TextStyle(
                                                    color: Color(0xFFFFFFFF)),
                                              ),
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
