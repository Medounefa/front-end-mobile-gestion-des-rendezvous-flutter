import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-rendez-vous-pris-par-des-patient-pour-medecin/listeDesRendezVousPourMedecins.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-patient-pour-secretaire/listePatientPourSecretaire.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/notifications/notificationPush.dart';

import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';
import 'package:gestiondesrendezvoushopitals/ui/users/UserInfoCard.dart';

class tableauDeBoardSecretaire extends StatefulWidget {
  const tableauDeBoardSecretaire({super.key});

  @override
  State<tableauDeBoardSecretaire> createState() =>
      _tableauDeBoardSecretaireState();
}

class _tableauDeBoardSecretaireState extends State<tableauDeBoardSecretaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF), // icône burger noir
        ),
        title: Text(
          "Tableau de \nbord medecin",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
        backgroundColor: Color(0xFF007BFF),
        toolbarHeight: 100,
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    (context),
                    MaterialPageRoute(builder: (context) => notificationPush()),
                  );
                },
                child: Container(
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Color(0xFF2196F3),
                        size: 40,
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
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            UserInfoCard(
              nomUtilisateur: "Ndeye Fall",
              role: "Secretaire",
              imagePath: "assets/images/medecin1.png",
            ),
            Expanded(
              child: Container(
                child: Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(1, 1),
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/examination.png",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              "rendez-vous du jour",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "13",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF666666),
                                fontSize: 25,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    listePatientPourSecretaire()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(1, 1),
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/doctor.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                "Liste de patients",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "25",
                                style: TextStyle(
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'poppins'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(1, 2),
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/medical-appointment.png",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              "Medecins disponibles",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: 'poppins'),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    listeDesRendezVousPourMedecins()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(1, 2),
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/hospital.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                " Rendez-vous venir",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "25",
                                style: TextStyle(
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    fontFamily: 'poppins'),
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
          ],
        ),
      ),
    );
  }
}
