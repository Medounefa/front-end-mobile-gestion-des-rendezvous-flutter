import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/rendez-vous/listeDesRendezVousDisponiblePourAdmin.dart';

class DetailsRendezVousPourPatientsAdmin extends StatefulWidget {
  const DetailsRendezVousPourPatientsAdmin({super.key});

  @override
  State<DetailsRendezVousPourPatientsAdmin> createState() =>
      _DetailsRendezVousPourPatientsAdminState();
}

class _DetailsRendezVousPourPatientsAdminState
    extends State<DetailsRendezVousPourPatientsAdmin> {
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
          "Details du  \nrendez-vous",
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
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(
            child: Container(
              width: 313,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1))
                ],
              ),
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 27),
                    width: 200,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xFF007BFF),
                    ),
                    child: Text(
                      "12 mars 2025 - 10:00",
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Medecin",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                "assets/images/med1.jpg",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr medoune Fall",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Cardiologue",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: const Color.fromARGB(47, 0, 0, 0),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Status",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: () {},
                                child: Text("En attente"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 1,
                          color: const Color.fromARGB(47, 0, 0, 0),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Adresse",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Hopital Fann Dakar"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          color: const Color.fromARGB(94, 0, 0, 0),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Motif",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Voici une suggestion de maquette mobile \npour un patient consultant historique \nde ses rendez-vous médicaux. Cette \nmaquette peut être créée dans Figma suit \nles standards UX/UI actuels pour une \namédicale conviviale et intuitive",
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF007BFF),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          (context),
                          MaterialPageRoute(
                            builder: (context) =>
                                listeDesRendezVousDisponiblePourAdmin(),
                          ),
                        );
                      },
                      child: Text(
                        "retourner",
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
