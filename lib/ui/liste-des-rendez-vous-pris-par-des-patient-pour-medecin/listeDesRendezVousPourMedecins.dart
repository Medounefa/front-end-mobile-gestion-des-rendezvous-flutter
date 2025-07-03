// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/ui/liste-des-rendez-vous-pris-par-des-patient-pour-medecin/detailsDuRendezVousDuPatientPourMedecin.dart';
// import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
// import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

// class listeDesRendezVousPourMedecins extends StatefulWidget {
//   const listeDesRendezVousPourMedecins({super.key});

//   @override
//   State<listeDesRendezVousPourMedecins> createState() =>
//       _listeDesRendezVousPourMedecinsState();
// }

// class _listeDesRendezVousPourMedecinsState
//     extends State<listeDesRendezVousPourMedecins> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Menu(),
//       appBar: AppBar(
//         title: Text(
//           "Liste des \nrendez-vous ",
//           style: TextStyle(color: Color(0xFFFFFFFF)),
//         ),
//         iconTheme: IconThemeData(
//           color: Color(0xFFFFFFFF), // icône burger noir
//         ),
//         backgroundColor: Color(0xFF007BFF),
//         toolbarHeight: 100,
//         actions: [
//           Row(
//             children: [
//               Container(
//                 child: Stack(
//                   children: [
//                     Icon(
//                       Icons.notifications,
//                       size: 40,
//                       color: Color(0xFF2196F3),
//                     ),
//                     Positioned(
//                       top: 2,
//                       right: 0,
//                       child: Container(
//                         width: 10,
//                         height: 10,
//                         decoration: BoxDecoration(
//                           color: Color(0xFFFFB74D),
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.white, width: 1.2),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(right: 10),
//                 child: ClipOval(
//                   child: UserMenu(),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Expanded(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Rechercher un patient...",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 2,
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         maximumSize: Size(150, 50),
//                         backgroundColor: Color(0xFF4CAF50),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () {},
//                     child: Icon(
//                       Icons.search,
//                       color: Color(0xFFFFFFFF),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Expanded(
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         child: SizedBox(
//                           height: 700,
//                           child: Expanded(
//                             child: GridView(
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 crossAxisSpacing: 10,
//                                 mainAxisSpacing: 10,
//                               ),
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       (context),
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             Detailsdurendezvousdupatientpourmedecin(),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF5F5F5),
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             spreadRadius: 4,
//                                             blurRadius: 4,
//                                             offset: Offset(1, 1))
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ClipOval(
//                                               child: Image.asset(
//                                                 "assets/images/med1.jpg",
//                                                 width: 60,
//                                                 height: 60,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Medoune Fall",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Motif : ",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text("Fievre ...")
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text("10/05/2025 - 09:00"),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF5F5F5),
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             spreadRadius: 4,
//                                             blurRadius: 4,
//                                             offset: Offset(1, 1))
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ClipOval(
//                                               child: Image.asset(
//                                                 "assets/images/med1.jpg",
//                                                 width: 60,
//                                                 height: 60,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Fatoumata Sall",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Motif : ",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text("Toux ...")
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text("10/10/2025 - 11:00"),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF5F5F5),
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             spreadRadius: 4,
//                                             blurRadius: 4,
//                                             offset: Offset(1, 1))
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ClipOval(
//                                               child: Image.asset(
//                                                 "assets/images/med1.jpg",
//                                                 width: 60,
//                                                 height: 60,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Marie Faye",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Motif : ",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text("Rougeur ...")
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text("10/05/2025 - 15:00"),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF5F5F5),
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             spreadRadius: 4,
//                                             blurRadius: 4,
//                                             offset: Offset(1, 1))
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ClipOval(
//                                               child: Image.asset(
//                                                 "assets/images/med1.jpg",
//                                                 width: 60,
//                                                 height: 60,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Ameth Sene",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Motif : ",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text("Fievre ...")
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text("10/01/2025 - 09:00"),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF5F5F5),
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             spreadRadius: 4,
//                                             blurRadius: 4,
//                                             offset: Offset(1, 1))
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ClipOval(
//                                               child: Image.asset(
//                                                 "assets/images/med1.jpg",
//                                                 width: 60,
//                                                 height: 60,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Medoune Fall",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Motif : ",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text("Fievre ...")
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text("10/05/2025 - 09:00"),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF5F5F5),
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             spreadRadius: 4,
//                                             blurRadius: 4,
//                                             offset: Offset(1, 1))
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ClipOval(
//                                               child: Image.asset(
//                                                 "assets/images/med1.jpg",
//                                                 width: 60,
//                                                 height: 60,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Medoune Fall",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Motif : ",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text("Fievre ...")
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text("10/05/2025 - 09:00"),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF5F5F5),
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             spreadRadius: 4,
//                                             blurRadius: 4,
//                                             offset: Offset(1, 1))
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ClipOval(
//                                               child: Image.asset(
//                                                 "assets/images/med1.jpg",
//                                                 width: 60,
//                                                 height: 60,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Medoune Fall",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Motif : ",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text("Fievre ...")
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text("10/05/2025 - 09:00"),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF5F5F5),
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             spreadRadius: 4,
//                                             blurRadius: 4,
//                                             offset: Offset(1, 1))
//                                       ],
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ClipOval(
//                                               child: Image.asset(
//                                                 "assets/images/med1.jpg",
//                                                 width: 60,
//                                                 height: 60,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Medoune Fall",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Motif : ",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text("Fievre ...")
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text("10/05/2025 - 09:00"),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/Ajout-rendez-vous-pour-patient-par-le-secretaire/ajouterRendezVousPourPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-rendez-vous-pris-par-des-patient-pour-medecin/detailsDuRendezVousDuPatientPourMedecin.dart';
import 'package:gestiondesrendezvoushopitals/ui/prise-de-rendez-vous/DetailsHistoriqueRendezVousPourPatients.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/rendez-vous/ajouterUnRendezVousPourPatientParAdmin.dart';
import 'package:gestiondesrendezvoushopitals/ui/rendez-vous/detailsRendezVous.dart';

class listeDesRendezVousPourMedecins extends StatefulWidget {
  const listeDesRendezVousPourMedecins({super.key});

  @override
  State<listeDesRendezVousPourMedecins> createState() =>
      _listeDesRendezVousPourMedecinsState();
}

class _listeDesRendezVousPourMedecinsState
    extends State<listeDesRendezVousPourMedecins> {
  final List<String> dates = [
    '12 mars 2025 - 10:00',
    '15 mars 2025 - 14:30',
    '78 mars 2025 - 09:00'
  ];
  final List<String> patients = [
    'Medoune Fall',
    'Fatoumata trao',
    'Mariete Dieng'
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
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF), // icône burger noir
        ),
        backgroundColor: Color(0xFF007BFF),
        toolbarHeight: 100,
        title: Text(
          "Liste des \nrendez-vous",
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
                      child: Icon(
                        Icons.search,
                        color: Color(0xFFFFFFFF),
                      ),
                      style: ElevatedButton.styleFrom(
                        // maximumSize: Size(150, 50),
                        backgroundColor: Color(0xFF4CAF50),
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
                                  Detailsdurendezvousdupatientpourmedecin(),
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
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
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
                                                children: patients
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
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
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
                                              children: patients
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
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
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
                                              children: patients
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
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
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
                                              children: patients
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
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
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
                                              children: patients
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
                            backgroundColor: Color(0xFF4CAF50),
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
                                      AjouterRendezVousPourPatient()),
                            );
                          },
                          child: Text(
                            "Ajouter",
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ),
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
