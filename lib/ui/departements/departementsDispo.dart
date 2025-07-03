import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/departements/ajouterDepartement.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class departementsDispo extends StatefulWidget {
  const departementsDispo({super.key});

  @override
  State<departementsDispo> createState() => _departementsDispoState();
}

class _departementsDispoState extends State<departementsDispo> {
  final List<String> departements = [
    "Deontologue",
    "Cardiologue",
    "Pneumologue",
    "Dentiste",
    "Churirgien",
    "Dermatologue",
    "Dibetolgue",
    "Urologue",
    "Ophtalmologue",
    "Cancerologue",
    "Dentiste",
    "Churirgien",
    "Dermatologue",
    "Dibetolgue",
    "Urologue",
    "Ophtalmologue",
    "Cancerologue",
  ];

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
          "liste des \ndepartements",
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
        padding: EdgeInsets.all(18),
        child: Container(
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(1, 1),
                )
              ]),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                    children: departements
                        .map((dpt) => (Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                    255, 184, 157, 157)
                                                .withOpacity(0.1),
                                          ),
                                          child: Text(
                                            dpt,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            )))
                        .toList()),
                Column(
                  children: [
                    Container(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4CAF50),
                        ),
                        onPressed: () {
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => ajoutDepartement()),
                          );
                        },
                        icon: Icon(
                          Icons.add,
                          color: Color(0xFFFFFFFF),
                        ),
                        label: Text(
                          "Ajouter un departement",
                          style: TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
