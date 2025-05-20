import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/prise-de-rendez-vous/PriseDErendezVous.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class ListmedecinPourPatient extends StatefulWidget {
  const ListmedecinPourPatient({super.key});

  @override
  State<ListmedecinPourPatient> createState() => _ListmedecinourpatientState();
}

class _ListmedecinourpatientState extends State<ListmedecinPourPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0CFAFA),
        toolbarHeight: 100,
        title: Text(
          "Liste des medecins \ndisponibles",
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
                padding: EdgeInsets.only(right: 10),
                child: ClipOval(
                  child: UserMenu(),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Recherche un medecins",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.search),
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(150, 50),
                      backgroundColor: Color(0xFF0CFAFA),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 25, bottom: 25),
                        margin: EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 700,
                          child: Expanded(
                            child: GridView(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(4, 4),
                                        ),
                                      ]),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/med1.jpg",
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Text(
                                                    "Dr Medoune",
                                                    style: TextStyle(
                                                        fontFamily: "poppins",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Column(
                                                    children: [
                                                      Text("Specialite :"),
                                                      Text("Cardiologue")
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Disponilite:",
                                                      style: TextStyle(
                                                          fontFamily: "poppins",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "10/08/25",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.place),
                                                            Text(
                                                                "Hopital Fann"),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0CFAFA),
                                                                shadowColor: Colors
                                                                    .transparent,
                                                                elevation: 0,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    side: BorderSide
                                                                        .none),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  (context),
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            PriseDeRendezVous(),
                                                                  ),
                                                                );
                                                              },
                                                              child: Text(
                                                                  "Prendez un RV")),
                                                        )
                                                      ],
                                                    ),
                                                    Column(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(4, 4),
                                        ),
                                      ]),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/med1.jpg",
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Text(
                                                    "Dr Mouhamed",
                                                    style: TextStyle(
                                                        fontFamily: "poppins",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Column(
                                                    children: [
                                                      Text("Specialite :"),
                                                      Text("Urologue")
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Disponilite:",
                                                      style: TextStyle(
                                                          fontFamily: "poppins",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "02/07/25",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.place),
                                                            Text(
                                                                "Hopital HIPYG"),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0CFAFA),
                                                                shadowColor: Colors
                                                                    .transparent,
                                                                elevation: 0,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    side: BorderSide
                                                                        .none),
                                                              ),
                                                              onPressed: () {},
                                                              child: Text(
                                                                  "Prendez un RV")),
                                                        )
                                                      ],
                                                    ),
                                                    Column(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(4, 4),
                                        ),
                                      ]),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/med1.jpg",
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Text(
                                                    "Dr Seynabou",
                                                    style: TextStyle(
                                                        fontFamily: "poppins",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Column(
                                                    children: [
                                                      Text("Specialite :"),
                                                      Text("Pnmologue")
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Disponilite:",
                                                      style: TextStyle(
                                                          fontFamily: "poppins",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "10/10/25",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.place),
                                                            Text(
                                                                "Hopital Fann"),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0CFAFA),
                                                                shadowColor: Colors
                                                                    .transparent,
                                                                elevation: 0,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    side: BorderSide
                                                                        .none),
                                                              ),
                                                              onPressed: () {},
                                                              child: Text(
                                                                  "Prendez un RV")),
                                                        )
                                                      ],
                                                    ),
                                                    Column(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(4, 4),
                                        ),
                                      ]),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/med1.jpg",
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Text(
                                                    "Dr Medoune",
                                                    style: TextStyle(
                                                        fontFamily: "poppins",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Column(
                                                    children: [
                                                      Text("Specialite :"),
                                                      Text("Dentiste")
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Disponilite:",
                                                      style: TextStyle(
                                                          fontFamily: "poppins",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "10/01/25",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.place),
                                                            Text(
                                                                "Hopital R.Toll"),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0CFAFA),
                                                                shadowColor: Colors
                                                                    .transparent,
                                                                elevation: 0,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    side: BorderSide
                                                                        .none),
                                                              ),
                                                              onPressed: () {},
                                                              child: Text(
                                                                  "Prendez un RV")),
                                                        )
                                                      ],
                                                    ),
                                                    Column(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(4, 4),
                                        ),
                                      ]),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/med1.jpg",
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Text(
                                                    "Dr Aissata",
                                                    style: TextStyle(
                                                        fontFamily: "poppins",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Column(
                                                    children: [
                                                      Text("Specialite :"),
                                                      Text("Chirugienne")
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Disponilite:",
                                                      style: TextStyle(
                                                          fontFamily: "poppins",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "10/03/25",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.place),
                                                            Text(
                                                                "Hopital Rifusque"),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0CFAFA),
                                                                shadowColor: Colors
                                                                    .transparent,
                                                                elevation: 0,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    side: BorderSide
                                                                        .none),
                                                              ),
                                                              onPressed: () {},
                                                              child: Text(
                                                                  "Prendez un RV")),
                                                        )
                                                      ],
                                                    ),
                                                    Column(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(4, 4),
                                        ),
                                      ]),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/med1.jpg",
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Text(
                                                    "Dr Diallo",
                                                    style: TextStyle(
                                                        fontFamily: "poppins",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Column(
                                                    children: [
                                                      Text("Specialite :"),
                                                      Text("Ophtalmo")
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Disponilite:",
                                                      style: TextStyle(
                                                          fontFamily: "poppins",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "10/07/25",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.place),
                                                            Text("Hopital GAE"),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0CFAFA),
                                                                shadowColor: Colors
                                                                    .transparent,
                                                                elevation: 0,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    side: BorderSide
                                                                        .none),
                                                              ),
                                                              onPressed: () {},
                                                              child: Text(
                                                                  "Prendez un RV")),
                                                        )
                                                      ],
                                                    ),
                                                    Column(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(4, 4),
                                        ),
                                      ]),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/med1.jpg",
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Text(
                                                    "Dr Mamadou",
                                                    style: TextStyle(
                                                        fontFamily: "poppins",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Column(
                                                    children: [
                                                      Text("Specialite :"),
                                                      Text("Pediatre")
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Disponilite:",
                                                      style: TextStyle(
                                                          fontFamily: "poppins",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "10/06/25",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.place),
                                                            Text(
                                                                "Hopital Albert R"),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0CFAFA),
                                                                shadowColor: Colors
                                                                    .transparent,
                                                                elevation: 0,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    side: BorderSide
                                                                        .none),
                                                              ),
                                                              onPressed: () {},
                                                              child: Text(
                                                                  "Prendez un RV")),
                                                        )
                                                      ],
                                                    ),
                                                    Column(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(4, 4),
                                        ),
                                      ]),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    "assets/images/med1.jpg",
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Text(
                                                    "Dr Coumba",
                                                    style: TextStyle(
                                                        fontFamily: "poppins",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: Column(
                                                    children: [
                                                      Text("Specialite :"),
                                                      Text("Renaux")
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Disponilite:",
                                                      style: TextStyle(
                                                          fontFamily: "poppins",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "10/04/25",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.place),
                                                            Text(
                                                                "Hopital K.Massar"),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          child: ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF0CFAFA),
                                                                shadowColor: Colors
                                                                    .transparent,
                                                                elevation: 0,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    side: BorderSide
                                                                        .none),
                                                              ),
                                                              onPressed: () {},
                                                              child: Text(
                                                                  "Prendez un RV")),
                                                        )
                                                      ],
                                                    ),
                                                    Column(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
