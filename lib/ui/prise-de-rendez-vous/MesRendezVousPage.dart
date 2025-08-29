// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/ui/prise-de-rendez-vous/DetailsHistoriqueRendezVousPourPatients.dart';
// import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
// import 'package:gestiondesrendezvoushopitals/ui/prise-de-rendez-vous/PriseDErendezVous.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HistoriqueRendezVousPourPatients extends StatefulWidget {
//   const HistoriqueRendezVousPourPatients({super.key});

//   @override
//   State<HistoriqueRendezVousPourPatients> createState() =>
//       _HistoriqueRendezVousPourPatientsState();
// }

// class _HistoriqueRendezVousPourPatientsState
//     extends State<HistoriqueRendezVousPourPatients> {
//   final List<String> dates = [
//     '12 mars 2025 - 10:00',
//     '15 mars 2025 - 14:30',
//     '78 mars 2025 - 09:00'
//   ];
//   final List<String> docteurs = [
//     'Dr. Medoune Fall',
//     'Dr. Fatoumata traore',
//     'Dr. Mariete Dieng'
//   ];
//   final List<String> specialites = [
//     'Cardiologue',
//     'Dermatologue',
//     'Gynécologue'
//   ];
//   final List<String> hopitaux = [
//     'Hopital fann',
//     'Hopital Dalah Jamm',
//     'Hopital Gae'
//   ];

//   final List<String> status = [
//     'Annule',
//     'Termine',
//     'En attente',
//   ];

//   Future<void> _goToPriseDeRendezVous() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('jwt_token') ?? '';
//     final role = prefs.getString('role') ?? '';
//     print('Token récupéré: "$token"');
//     print('Role récupéré: "$role"');

//     if (token.isNotEmpty && role.isNotEmpty) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PriseDeRendezVous(
//             token: token,
//             userRole: role,
//           ),
//         ),
//       );
//     } else {
//       // gérer le cas où token ou rôle est manquant
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Erreur: utilisateur non authentifié")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final rendezVous = List.generate(dates.length, (index) {
//     //   return {
//     //     'date': dates[index],
//     //     'docteur': docteurs[index],
//     //     'specialite': specialites[index],
//     //     'hopital': hopitaux[index],
//     //   };
//     // });

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       drawer: Menu(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Color(0xFFFFFFFF), // icône burger noir
//         ),
//         backgroundColor: Color(0xFF007BFF),
//         toolbarHeight: 100,
//         title: Text(
//           "Liste de mes \nrendez-vous",
//           style: TextStyle(color: Color(0xFFFFFFFF)),
//         ),
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
//                   child: Image.asset(
//                     "assets/images/logo.jpg",
//                     width: 40,
//                     height: 40,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Expanded(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     child: Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText:
//                               "Recherche un rendez-par date par hopital ou par medecin",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       child: Icon(
//                         Icons.search,
//                         color: Color(0xFFFFFFFF),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         // maximumSize: Size(150, 50),
//                         backgroundColor: Color(0xFF4CAF50),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             child: Row(
//                               children: [
//                                 Spacer(),
//                                 ElevatedButton.icon(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Color(0xFF4CAF50),
//                                   ),
//                                   onPressed: _goToPriseDeRendezVous,
//                                   icon: Icon(
//                                     Icons.add,
//                                     color: Color(0xFFFFFFFF),
//                                   ),
//                                   label: Text(
//                                     "Nouveau Rendez-vous",
//                                     style: TextStyle(color: Color(0xFFFFFFFF)),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             (context),
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   DetailsHistoriqueRendezVousPourPatients(),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.all(20),
//                                     width: 328,
//                                     height: 125,
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF5F5F5),
//                                       border: Border.all(
//                                         color: const Color.fromARGB(
//                                             255, 121, 117, 117),
//                                         width: 0.2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color:
//                                                 Colors.black.withOpacity(0.1),
//                                             spreadRadius: 2,
//                                             blurRadius: 6,
//                                             offset: Offset(0, 3))
//                                       ],
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Container(
//                                               child: Column(
//                                                 children: dates
//                                                     .take(1)
//                                                     .map((date) => Container(
//                                                           child: Text(
//                                                             date,
//                                                             style: TextStyle(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold),
//                                                           ),
//                                                         ))
//                                                     .toList(),
//                                               ),
//                                             ),
//                                             Container(
//                                               child: Row(
//                                                 children: docteurs
//                                                     .take(1)
//                                                     .map((docteur) => Container(
//                                                           child: Text(
//                                                             docteur,
//                                                             style: TextStyle(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold),
//                                                           ),
//                                                         ))
//                                                     .toList(),
//                                               ),
//                                             ),
//                                             Container(
//                                               child: Row(
//                                                 children: specialites
//                                                     .take(1)
//                                                     .map((specialite) =>
//                                                         Container(
//                                                           child:
//                                                               Text(specialite),
//                                                         ))
//                                                     .toList(),
//                                               ),
//                                             ),
//                                             Container(
//                                               child: Row(
//                                                 children: hopitaux
//                                                     .take(1)
//                                                     .map((hopital) => Container(
//                                                           child: Text(hopital),
//                                                         ))
//                                                     .toList(),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: status
//                                               .take(1)
//                                               .map((st) => Container(
//                                                     height: 40,
//                                                     width: 100,
//                                                     decoration: BoxDecoration(
//                                                         color: const Color
//                                                             .fromARGB(
//                                                             75, 228, 52, 39),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20),
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                             color: Colors.black
//                                                                 .withOpacity(
//                                                                     0.1),
//                                                             spreadRadius: 2,
//                                                             blurRadius: 6,
//                                                             offset:
//                                                                 Offset(0, 3),
//                                                           ),
//                                                         ]),
//                                                     child: TextButton(
//                                                       onPressed: () {},
//                                                       child: Text(
//                                                         st,
//                                                         style: TextStyle(
//                                                             color: Color(
//                                                                 0xFFFFFFFF),
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold),
//                                                       ),
//                                                     ),
//                                                   ))
//                                               .toList(),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 17,
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(20),
//                                   width: 328,
//                                   height: 125,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFFF5F5F5),
//                                     border: Border.all(
//                                       color: const Color.fromARGB(
//                                           255, 121, 117, 117),
//                                       width: 0.2,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.black.withOpacity(0.1),
//                                           spreadRadius: 2,
//                                           blurRadius: 6,
//                                           offset: Offset(0, 3))
//                                     ],
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             child: Column(
//                                               children: dates
//                                                   .skip(1)
//                                                   .take(1)
//                                                   .map((date) => Container(
//                                                         child: Text(
//                                                           date,
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: docteurs
//                                                   .skip(1)
//                                                   .take(1)
//                                                   .map((docteur) => Container(
//                                                         child: Text(
//                                                           docteur,
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: specialites
//                                                   .skip(1)
//                                                   .take(1)
//                                                   .map((specialite) =>
//                                                       Container(
//                                                         child: Text(specialite),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: hopitaux
//                                                   .skip(1)
//                                                   .take(1)
//                                                   .map((hopital) => Container(
//                                                         child: Text(hopital),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: status
//                                             .skip(1)
//                                             .take(1)
//                                             .map((st) => Container(
//                                                   height: 40,
//                                                   width: 100,
//                                                   decoration: BoxDecoration(
//                                                       color:
//                                                           const Color.fromARGB(
//                                                               87, 76, 175, 79),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20),
//                                                       boxShadow: [
//                                                         BoxShadow(
//                                                           color: Colors.black
//                                                               .withOpacity(0.1),
//                                                           spreadRadius: 2,
//                                                           blurRadius: 6,
//                                                           offset: Offset(0, 3),
//                                                         ),
//                                                       ]),
//                                                   child: TextButton(
//                                                     onPressed: () {},
//                                                     child: Text(
//                                                       st,
//                                                       style: TextStyle(
//                                                           color: Colors.green,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     ),
//                                                   ),
//                                                 ))
//                                             .toList(),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 17,
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(20),
//                                   width: 328,
//                                   height: 125,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFFF5F5F5),
//                                     border: Border.all(
//                                       color: const Color.fromARGB(
//                                           255, 121, 117, 117),
//                                       width: 0.2,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.black.withOpacity(0.1),
//                                           spreadRadius: 2,
//                                           blurRadius: 6,
//                                           offset: Offset(0, 3))
//                                     ],
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             child: Column(
//                                               children: dates
//                                                   .skip(2)
//                                                   .take(1)
//                                                   .map((date) => Container(
//                                                         child: Text(
//                                                           date,
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: docteurs
//                                                   .skip(2)
//                                                   .take(1)
//                                                   .map((docteur) => Container(
//                                                         child: Text(
//                                                           docteur,
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: specialites
//                                                   .skip(2)
//                                                   .take(1)
//                                                   .map((specialite) =>
//                                                       Container(
//                                                         child: Text(specialite),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: hopitaux
//                                                   .skip(2)
//                                                   .take(1)
//                                                   .map((hopital) => Container(
//                                                         child: Text(hopital),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: status
//                                             .skip(2)
//                                             .take(1)
//                                             .map((st) => Container(
//                                                   height: 40,
//                                                   width: 100,
//                                                   decoration: BoxDecoration(
//                                                       color:
//                                                           const Color.fromARGB(
//                                                               80, 255, 235, 59),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20),
//                                                       boxShadow: [
//                                                         BoxShadow(
//                                                           color: Colors.black
//                                                               .withOpacity(0.1),
//                                                           spreadRadius: 2,
//                                                           blurRadius: 6,
//                                                           offset: Offset(0, 3),
//                                                         ),
//                                                       ]),
//                                                   child: TextButton(
//                                                     onPressed: () {},
//                                                     child: Text(
//                                                       st,
//                                                       style: TextStyle(
//                                                           color: const Color
//                                                               .fromARGB(
//                                                               255, 206, 185, 2),
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     ),
//                                                   ),
//                                                 ))
//                                             .toList(),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 17,
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(20),
//                                   width: 328,
//                                   height: 125,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFFF5F5F5),
//                                     border: Border.all(
//                                       color: const Color.fromARGB(
//                                           255, 121, 117, 117),
//                                       width: 0.2,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.black.withOpacity(0.1),
//                                           spreadRadius: 2,
//                                           blurRadius: 6,
//                                           offset: Offset(0, 3))
//                                     ],
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             child: Column(
//                                               children: dates
//                                                   .take(1)
//                                                   .map((date) => Container(
//                                                         child: Text(
//                                                           date,
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: docteurs
//                                                   .take(1)
//                                                   .map((docteur) => Container(
//                                                         child: Text(
//                                                           docteur,
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: specialites
//                                                   .take(1)
//                                                   .map((specialite) =>
//                                                       Container(
//                                                         child: Text(specialite),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: hopitaux
//                                                   .take(1)
//                                                   .map((hopital) => Container(
//                                                         child: Text(hopital),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: status
//                                             .take(1)
//                                             .map((st) => Container(
//                                                   height: 40,
//                                                   width: 100,
//                                                   decoration: BoxDecoration(
//                                                       color:
//                                                           const Color.fromARGB(
//                                                               83, 228, 52, 39),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20),
//                                                       boxShadow: [
//                                                         BoxShadow(
//                                                           color: Colors.black
//                                                               .withOpacity(0.1),
//                                                           spreadRadius: 2,
//                                                           blurRadius: 6,
//                                                           offset: Offset(0, 3),
//                                                         ),
//                                                       ]),
//                                                   child: TextButton(
//                                                     onPressed: () {},
//                                                     child: Text(
//                                                       st,
//                                                       style: TextStyle(
//                                                           color: Colors.red,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     ),
//                                                   ),
//                                                 ))
//                                             .toList(),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 17,
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(20),
//                                   width: 328,
//                                   height: 125,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFFF5F5F5),
//                                     border: Border.all(
//                                       color: const Color.fromARGB(
//                                           255, 121, 117, 117),
//                                       width: 0.2,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.black.withOpacity(0.1),
//                                           spreadRadius: 2,
//                                           blurRadius: 6,
//                                           offset: Offset(0, 3))
//                                     ],
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             child: Column(
//                                               children: dates
//                                                   .skip(1)
//                                                   .take(1)
//                                                   .map((date) => Container(
//                                                         child: Text(
//                                                           date,
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: docteurs
//                                                   .take(1)
//                                                   .take(1)
//                                                   .map((docteur) => Container(
//                                                         child: Text(
//                                                           docteur,
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold),
//                                                         ),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: specialites
//                                                   .skip(1)
//                                                   .take(1)
//                                                   .map((specialite) =>
//                                                       Container(
//                                                         child: Text(specialite),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           ),
//                                           Container(
//                                             child: Row(
//                                               children: hopitaux
//                                                   .skip(1)
//                                                   .take(1)
//                                                   .map((hopital) => Container(
//                                                         child: Text(hopital),
//                                                       ))
//                                                   .toList(),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: status
//                                             .skip(1)
//                                             .take(1)
//                                             .map((st) => Container(
//                                                   height: 40,
//                                                   width: 100,
//                                                   decoration: BoxDecoration(
//                                                       color:
//                                                           const Color.fromARGB(
//                                                               62, 76, 175, 79),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20),
//                                                       boxShadow: [
//                                                         BoxShadow(
//                                                           color: Colors.black
//                                                               .withOpacity(0.1),
//                                                           spreadRadius: 2,
//                                                           blurRadius: 6,
//                                                           offset: Offset(0, 3),
//                                                         ),
//                                                       ]),
//                                                   child: TextButton(
//                                                     onPressed: () {},
//                                                     child: Text(
//                                                       st,
//                                                       style: TextStyle(
//                                                           color: Colors.green,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                     ),
//                                                   ),
//                                                 ))
//                                             .toList(),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/prise-de-rendez-vous/DetailsRendezVousPage.dart';
import 'package:gestiondesrendezvoushopitals/ui/prise-de-rendez-vous/PriseDeRendezVous.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart'; // ton fichier ApiMobileRv
// ton fichier ApiMobileRv

class MesRendezVousPage extends StatefulWidget {
  @override
  _MesRendezVousPageState createState() => _MesRendezVousPageState();
}

class _MesRendezVousPageState extends State<MesRendezVousPage> {
  List<dynamic> mesRendezVous = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _chargerMesRendezVous();
  }

  Future<void> _chargerMesRendezVous() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    final role = prefs.getString('role');
    final userId = prefs.getInt('user_id');

    if (token == null || role == null || userId == null) {
      print("Erreur : token ou role ou user_id non trouvé");
      return;
    }

    List allRdv = await ApiMobileRv.getRendezVous(token, role);

    // Filtrer selon le rôle
    if (role == 'patient') {
      mesRendezVous = allRdv.where((r) => r['patient_id'] == userId).toList();
    } else if (role == 'medecin') {
      mesRendezVous = allRdv.where((r) => r['medecin_id'] == userId).toList();
    } else {
      mesRendezVous = allRdv; // secrétaire ou admin
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _modifierRdv(
      int rdvId, String date, String heure, String description) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    if (token == null) return;

    bool success = await ApiMobileRv.modifierRendezVous(
        token, rdvId, date, heure, description);

    if (success) {
      _chargerMesRendezVous();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Rendez-vous modifié")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur lors de la modification")));
    }
  }

  void _showModifierDialog(Map rdv) {
    final dateController = TextEditingController(text: rdv['date']);
    final heureController = TextEditingController(text: rdv['heure']);
    final descController =
        TextEditingController(text: rdv['description'] ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Modifier Rendez-vous"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: "Date (YYYY-MM-DD)"),
            ),
            TextField(
              controller: heureController,
              decoration: InputDecoration(labelText: "Heure (HH:MM)"),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: "Description"),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("Annuler")),
          ElevatedButton(
            onPressed: () {
              _modifierRdv(rdv['id'], dateController.text, heureController.text,
                  descController.text);
              Navigator.pop(context);
            },
            child: Text("Enregistrer"),
          ),
        ],
      ),
    );
  }

  Future<void> _annulerRdv(int rdvId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    if (token == null) return;

    bool success = await ApiMobileRv.annulerRendezVous(token, rdvId);
    if (success) {
      _chargerMesRendezVous();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Rendez-vous annulé")));
    }
  }

  Future<void> _supprimerRdv(int rdvId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    if (token == null) return;

    bool success = await ApiMobileRv.supprimerRendezVous(token, rdvId);
    if (success) {
      _chargerMesRendezVous();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Rendez-vous supprimé")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF007BFF),
        toolbarHeight: 100,
        title: Text(
          "Liste des rendez-vous",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          isLoading
              ? Center(child: CircularProgressIndicator())
              : mesRendezVous.isEmpty
                  ? Center(child: Text("Aucun rendez-vous trouvé"))
                  : ListView.builder(
                      itemCount: mesRendezVous.length,
                      itemBuilder: (context, index) {
                        final rdv = mesRendezVous[index];
                        return Card(
                          child: ListTile(
                            title: Text("Avec Dr ${rdv['medecin_full_name']}"),
                            subtitle: Text(
                                "Le ${rdv['date']} à ${rdv['heure']}\nStatut: ${rdv['statut']}"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsRendezVousPage(rdv: rdv),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
          // Bouton en bas à droite
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton.icon(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final token = prefs.getString('jwt_token') ?? '';
                final userId = prefs.getInt('user_id');
                final userRole = prefs.getString('role') ?? '';

                if (token.isEmpty || userId == null || userRole.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Erreur : token, user_id ou role introuvable")));
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PriseDeRendezVous(
                      userRole: userRole,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.add),
              label: Text("Nouveau RDV"),
            ),
          ),
        ],
      ),
    );
  }
}
