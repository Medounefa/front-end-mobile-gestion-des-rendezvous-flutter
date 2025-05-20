import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/consultation-du-patient-par-le-medecin/consultionDuPatientParLeMedecin.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class Detailsdurendezvousdupatientpourmedecin extends StatefulWidget {
  const Detailsdurendezvousdupatientpourmedecin({super.key});

  @override
  State<Detailsdurendezvousdupatientpourmedecin> createState() =>
      _DetailsdurendezvousdupatientpourmedecinState();
}

class _DetailsdurendezvousdupatientpourmedecinState
    extends State<Detailsdurendezvousdupatientpourmedecin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0CFAFA),
        toolbarHeight: 125,
        title: Text("details du \nrendez-vous"),
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
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Expanded(
            child: Container(
              width: 348,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        width: 200,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Color(0xFF0CFAFA),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "21 Aout 2025 - 10:00",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25, left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Patient",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                "assets/images/med1.jpg",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Medoune Fall",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 1,
                    color: const Color.fromARGB(47, 0, 0, 0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Information personelle du patient",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Adresse : ",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Keur Massar U15")
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Telephone : ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("77 787 457 10"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Email : ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("fallmedoune21@gmail"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 1,
                          color: const Color.fromARGB(47, 0, 0, 0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Medecin",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/images/med1.jpg",
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Dr Medoune Fall",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Pneumologue")
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 1,
                          color: const Color.fromARGB(47, 0, 0, 0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 25),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Motif : ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Voici une suggestion de maquette mobile \npour un patient consultant historique \nde ses rendez-vous médicaux. Cette \nmaquette peut être créée dans Figma suit \nles standards UX/UI actuels pour une \namédicale conviviale et intuitive",
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 1,
                          color: const Color.fromARGB(47, 0, 0, 0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 25),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Hopital :",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.place),
                                  Text("Hopital Fann ")
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 1,
                          color: const Color.fromARGB(47, 0, 0, 0),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.yellow,
                                        shadowColor:
                                            Colors.black.withOpacity(0.1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    child: Text("Reprogrammer"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        (context),
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConsultionDuPatientParLeMedecin()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.greenAccent,
                                        shadowColor:
                                            Colors.black.withOpacity(0.1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    child: Text("Consulter"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
