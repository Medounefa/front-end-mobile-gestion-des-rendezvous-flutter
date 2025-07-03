import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-rendez-vous-pris-par-des-patient-pour-medecin/listeDesRendezVousPourMedecins.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/notifications/notificationPush.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class ConsultionDuPatientParLeMedecin extends StatefulWidget {
  const ConsultionDuPatientParLeMedecin({super.key});

  @override
  State<ConsultionDuPatientParLeMedecin> createState() =>
      _ConsultionDuPatientParLeMedecinState();
}

class _ConsultionDuPatientParLeMedecinState
    extends State<ConsultionDuPatientParLeMedecin> {
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            // content: Text('Rendez-vous pris avec succes'),
            actions: [
              // Text("Rendez-vous pris avec succes"),
              // TextButton(
              //   child: Text('Annuler'),
              //   onPressed: () {
              //     Navigator.of(context).pop(); // Fermer le popup
              //   },
              // ),
              // TextButton(
              //   child: Text('Oui'),
              //   onPressed: () {
              //     Navigator.of(context).pop(); // Fermer
              //     // 👉 Action à exécuter
              //     print('Action confirmée');
              //   },
              // ),
              Container(
                padding: EdgeInsets.only(left: 200),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: () {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) =>
                                listeDesRendezVousPourMedecins()));
                  },
                  child: Text("x"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/right.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Patient Consulte"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text(
          "consultation du  \npatient",
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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
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
                Column(
                  children: [
                    Text(
                      "Patient ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Row(
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
                          "Marietou Dieng",
                          style: TextStyle(fontSize: 17),
                        ),
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
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Age : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(47, 0, 0, 0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sexe: ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(47, 0, 0, 0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Temerature : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(47, 0, 0, 0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Poids : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(47, 0, 0, 0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Taille : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(47, 0, 0, 0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Analyse : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(47, 0, 0, 0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF4CAF50),
                                shadowColor: Colors.black.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                            onPressed: () => _showConfirmationDialog(context),
                            child: Text(
                              "Valider",
                              style: TextStyle(color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
