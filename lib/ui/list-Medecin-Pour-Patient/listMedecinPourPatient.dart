import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
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
      drawer: Menu(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF), // icône burger noir
        ),
        backgroundColor: Color(0xFF007BFF),
        toolbarHeight: 100,
        title: Text(
          "Liste des \nmedecins \ndisponibles",
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
                    child: Icon(
                      Icons.search,
                      color: Color(0xFFFFFFFF),
                    ),
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(150, 50),
                      backgroundColor: Color(0xFF4CAF50),
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
                          child: GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 165,
                              crossAxisCount: 1,
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
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        offset: Offset(0, 0),
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "Dr Medoune",
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Specialite :"),
                                                        Text("Cardiologue"),
                                                      ],
                                                    ),
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
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.place),
                                                      Text("Hopital Fann"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 25,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF4CAF50),
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                side: BorderSide.none),
                                          ),
                                          onPressed: () {
                                            // Navigator.push(
                                            //   (context),
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         PriseDeRendezVous(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Prendez un RV",
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      )
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "Dr Medoune",
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Specialite :"),
                                                        Text("Cardiologue"),
                                                      ],
                                                    ),
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
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.place),
                                                      Text("Hopital Fann"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 25,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF4CAF50),
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                side: BorderSide.none),
                                          ),
                                          onPressed: () {
                                            // Navigator.push(
                                            //   (context),
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         PriseDeRendezVous(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Prendez un RV",
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      )
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "Dr Medoune",
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Specialite :"),
                                                        Text("Cardiologue"),
                                                      ],
                                                    ),
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
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.place),
                                                      Text("Hopital Fann"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 25,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF4CAF50),
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                side: BorderSide.none),
                                          ),
                                          onPressed: () {
                                            // Navigator.push(
                                            //   (context),
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         PriseDeRendezVous(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Prendez un RV",
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      )
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "Dr Medoune",
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Specialite :"),
                                                        Text("Cardiologue"),
                                                      ],
                                                    ),
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
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.place),
                                                      Text("Hopital Fann"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 25,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF4CAF50),
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                side: BorderSide.none),
                                          ),
                                          onPressed: () {
                                            // Navigator.push(
                                            //   (context),
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         PriseDeRendezVous(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Prendez un RV",
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      )
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "Dr Medoune",
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Specialite :"),
                                                        Text("Cardiologue"),
                                                      ],
                                                    ),
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
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.place),
                                                      Text("Hopital Fann"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 25,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF4CAF50),
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                side: BorderSide.none),
                                          ),
                                          onPressed: () {
                                            // Navigator.push(
                                            //   (context),
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         PriseDeRendezVous(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Prendez un RV",
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      )
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "Dr Medoune",
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Specialite :"),
                                                        Text("Cardiologue"),
                                                      ],
                                                    ),
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
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.place),
                                                      Text("Hopital Fann"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 25,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF4CAF50),
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                side: BorderSide.none),
                                          ),
                                          onPressed: () {
                                            // Navigator.push(
                                            //   (context),
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         PriseDeRendezVous(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Prendez un RV",
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      )
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "Dr Medoune",
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Specialite :"),
                                                        Text("Cardiologue"),
                                                      ],
                                                    ),
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
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.place),
                                                      Text("Hopital Fann"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 25,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF4CAF50),
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                side: BorderSide.none),
                                          ),
                                          onPressed: () {
                                            // Navigator.push(
                                            //   (context),
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         PriseDeRendezVous(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Prendez un RV",
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      )
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "Dr Medoune",
                                                  style: TextStyle(
                                                      fontFamily: "poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Specialite :"),
                                                        Text("Cardiologue"),
                                                      ],
                                                    ),
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
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.place),
                                                      Text("Hopital Fann"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 25,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF4CAF50),
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                side: BorderSide.none),
                                          ),
                                          onPressed: () {
                                            // Navigator.push(
                                            //   (context),
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         PriseDeRendezVous(),
                                            //   ),
                                            // );
                                          },
                                          child: Text(
                                            "Prendez un RV",
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
