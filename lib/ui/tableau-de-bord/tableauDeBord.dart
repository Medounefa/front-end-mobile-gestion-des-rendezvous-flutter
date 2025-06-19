import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/notifications/notificationPush.dart';

import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class tableauDeBord extends StatefulWidget {
  const tableauDeBord({super.key});

  @override
  State<tableauDeBord> createState() => _tableauDeBordState();
}

class _tableauDeBordState extends State<tableauDeBord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Tableau de \nbord"),
        backgroundColor: Color(0xFF0CFAFA),
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
                        color: Colors.white,
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
                          "Patients",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "15",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0CFAFA),
                            fontSize: 25,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                          "Medecins",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "25",
                          style: TextStyle(
                              color: Color(0xFF0CFAFA),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'poppins'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              "assets/images/customer-support.png",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Secretaires",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "25",
                          style: TextStyle(
                              color: Color(0xFF0CFAFA),
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'poppins'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              "assets/images/medical-appointment.png",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Rendez-vous",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "25",
                          style: TextStyle(
                              color: Color(0xFF0CFAFA),
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'poppins'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                          "Hopitaux",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "25",
                          style: TextStyle(
                              color: Color(0xFF0CFAFA),
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'poppins'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              "assets/images/departement.png",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Departements : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "25",
                          style: TextStyle(
                              color: Color(0xFF0CFAFA),
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'poppins'),
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
