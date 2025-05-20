import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-rendez-vous-pris-par-des-patient-pour-medecin/listeDesRendezVousPourMedecins.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class notificationPush extends StatefulWidget {
  const notificationPush({super.key});

  @override
  State<notificationPush> createState() => _notificationPushState();
}

class _notificationPushState extends State<notificationPush> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0CFAFA),
        toolbarHeight: 100,
        title: Text("Notification"),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {},
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
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
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
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("0 notifications ont été reçues"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          shadowColor: Colors.black.withOpacity(0.1),
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    listeDesRendezVousPourMedecins()),
                          );
                        },
                        child: Text("Retour"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
