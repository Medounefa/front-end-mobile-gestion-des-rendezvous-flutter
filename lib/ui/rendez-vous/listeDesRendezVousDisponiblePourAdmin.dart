import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/historique-rendez-vous-pour-patients/DetailsHistoriqueRendezVousPourPatients.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/rendez-vous/ajouterUnRendezVousPourPatientParAdmin.dart';
import 'package:gestiondesrendezvoushopitals/ui/rendez-vous/detailsRendezVous.dart';

class listeDesRendezVousDisponiblePourAdmin extends StatefulWidget {
  const listeDesRendezVousDisponiblePourAdmin({super.key});

  @override
  State<listeDesRendezVousDisponiblePourAdmin> createState() =>
      _listeDesRendezVousDisponiblePourAdminState();
}

class _listeDesRendezVousDisponiblePourAdminState
    extends State<listeDesRendezVousDisponiblePourAdmin> {
  final List<String> dates = [
    '12 mars 2025 - 10:00',
    '15 mars 2025 - 14:30',
    '78 mars 2025 - 09:00'
  ];
  final List<String> docteurs = [
    'Dr. Medoune Fall',
    'Dr. Fatoumata traore',
    'Dr. Mariete Dieng'
  ];
  final List<String> specialites = [
    'Cardiologue',
    'Dermatologue',
    'Gynécologue'
  ];
  final List<String> hopitaux = [
    'Hopital fann',
    'Hopital Dalah Jamm',
    'Hopital Gae'
  ];

  final List<String> status = [
    'Annule',
    'Termine',
    'En attente',
  ];

  @override
  Widget build(BuildContext context) {
    // final rendezVous = List.generate(dates.length, (index) {
    //   return {
    //     'date': dates[index],
    //     'docteur': docteurs[index],
    //     'specialite': specialites[index],
    //     'hopital': hopitaux[index],
    //   };
    // });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Color(0xFF0CFAFA),
        toolbarHeight: 100,
        title: Text(
          "Liste des \nrendez-vous",
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
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText:
                              "Recherche un rendez-par date par hopital ou par medecin",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.search),
                      style: ElevatedButton.styleFrom(
                        // maximumSize: Size(150, 50),
                        backgroundColor: Color(0xFF0CFAFA),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsRendezVousPourPatientsAdmin(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    width: 328,
                                    height: 125,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 121, 117, 117),
                                        width: 0.2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Column(
                                                children: dates
                                                    .take(1)
                                                    .map((date) => Container(
                                                          child: Text(
                                                            date,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: docteurs
                                                    .take(1)
                                                    .map((docteur) => Container(
                                                          child: Text(
                                                            docteur,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: specialites
                                                    .take(1)
                                                    .map((specialite) =>
                                                        Container(
                                                          child:
                                                              Text(specialite),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: hopitaux
                                                    .take(1)
                                                    .map((hopital) => Container(
                                                          child: Text(hopital),
                                                        ))
                                                    .toList(),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: status
                                              .take(1)
                                              .map((st) => Container(
                                                    height: 40,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            75, 228, 52, 39),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            spreadRadius: 2,
                                                            blurRadius: 6,
                                                            offset:
                                                                Offset(0, 3),
                                                          ),
                                                        ]),
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        st,
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: 328,
                                  height: 125,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 121, 117, 117),
                                      width: 0.2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          offset: Offset(0, 3))
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: dates
                                                  .skip(1)
                                                  .take(1)
                                                  .map((date) => Container(
                                                        child: Text(
                                                          date,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: docteurs
                                                  .skip(1)
                                                  .take(1)
                                                  .map((docteur) => Container(
                                                        child: Text(
                                                          docteur,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: specialites
                                                  .skip(1)
                                                  .take(1)
                                                  .map((specialite) =>
                                                      Container(
                                                        child: Text(specialite),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: hopitaux
                                                  .skip(1)
                                                  .take(1)
                                                  .map((hopital) => Container(
                                                        child: Text(hopital),
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: status
                                            .skip(1)
                                            .take(1)
                                            .map((st) => Container(
                                                  height: 40,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              87, 76, 175, 79),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          spreadRadius: 2,
                                                          blurRadius: 6,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ]),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      st,
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: 328,
                                  height: 125,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 121, 117, 117),
                                      width: 0.2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          offset: Offset(0, 3))
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: dates
                                                  .skip(2)
                                                  .take(1)
                                                  .map((date) => Container(
                                                        child: Text(
                                                          date,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: docteurs
                                                  .skip(2)
                                                  .take(1)
                                                  .map((docteur) => Container(
                                                        child: Text(
                                                          docteur,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: specialites
                                                  .skip(2)
                                                  .take(1)
                                                  .map((specialite) =>
                                                      Container(
                                                        child: Text(specialite),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: hopitaux
                                                  .skip(2)
                                                  .take(1)
                                                  .map((hopital) => Container(
                                                        child: Text(hopital),
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: status
                                            .skip(2)
                                            .take(1)
                                            .map((st) => Container(
                                                  height: 40,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              80, 255, 235, 59),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          spreadRadius: 2,
                                                          blurRadius: 6,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ]),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      st,
                                                      style: TextStyle(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 206, 185, 2),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: 328,
                                  height: 125,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 121, 117, 117),
                                      width: 0.2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          offset: Offset(0, 3))
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: dates
                                                  .take(1)
                                                  .map((date) => Container(
                                                        child: Text(
                                                          date,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: docteurs
                                                  .take(1)
                                                  .map((docteur) => Container(
                                                        child: Text(
                                                          docteur,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: specialites
                                                  .take(1)
                                                  .map((specialite) =>
                                                      Container(
                                                        child: Text(specialite),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: hopitaux
                                                  .take(1)
                                                  .map((hopital) => Container(
                                                        child: Text(hopital),
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: status
                                            .take(1)
                                            .map((st) => Container(
                                                  height: 40,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              83, 228, 52, 39),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          spreadRadius: 2,
                                                          blurRadius: 6,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ]),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      st,
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: 328,
                                  height: 125,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 121, 117, 117),
                                      width: 0.2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          offset: Offset(0, 3))
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: dates
                                                  .skip(1)
                                                  .take(1)
                                                  .map((date) => Container(
                                                        child: Text(
                                                          date,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: docteurs
                                                  .take(1)
                                                  .take(1)
                                                  .map((docteur) => Container(
                                                        child: Text(
                                                          docteur,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: specialites
                                                  .skip(1)
                                                  .take(1)
                                                  .map((specialite) =>
                                                      Container(
                                                        child: Text(specialite),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: hopitaux
                                                  .skip(1)
                                                  .take(1)
                                                  .map((hopital) => Container(
                                                        child: Text(hopital),
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: status
                                            .skip(1)
                                            .take(1)
                                            .map((st) => Container(
                                                  height: 40,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              62, 76, 175, 79),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          spreadRadius: 2,
                                                          blurRadius: 6,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ]),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      st,
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            shadowColor: Colors.black.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AjouterRendezVousPourPatientParAdmin()),
                            );
                          },
                          child: Text("Ajouter"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
