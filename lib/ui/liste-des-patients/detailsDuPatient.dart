import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/Ajout-rendez-vous-pour-patient-par-le-secretaire/ajouterRendezVousPourPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-patients/programmerUnRvPourPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/notifications/notificationPush.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class detailsDuPatient extends StatefulWidget {
  const detailsDuPatient({super.key});

  @override
  State<detailsDuPatient> createState() => _detailsDuPatientState();
}

class _detailsDuPatientState extends State<detailsDuPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details du \npatient",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF), // icône burger noir
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
        child: Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(1, 1))
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/med1.jpg",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Medoune Fall",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Adresse : ",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text("Keur Massar"),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "Telephone : ",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text("77 8555 4455 "),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email : ",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text("medoune1245@gmail.com"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black.withOpacity(0.1),
                            backgroundColor: Color(0xFF4CAF50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProgrammerunRvPourPatient()),
                            );
                          },
                          child: Text(
                            "Programmer un rendez-vous",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
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
