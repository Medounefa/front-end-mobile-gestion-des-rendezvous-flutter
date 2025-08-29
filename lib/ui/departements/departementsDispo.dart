// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/ui/departements/ajouterDepartement.dart';
// import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
// import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

// class departementsDispo extends StatefulWidget {
//   const departementsDispo({super.key});

//   @override
//   State<departementsDispo> createState() => _departementsDispoState();
// }

// class _departementsDispoState extends State<departementsDispo> {
//   final List<String> departements = [
//     "Deontologue",
//     "Cardiologue",
//     "Pneumologue",
//     "Dentiste",
//     "Churirgien",
//     "Dermatologue",
//     "Dibetolgue",
//     "Urologue",
//     "Ophtalmologue",
//     "Cancerologue",
//     "Dentiste",
//     "Churirgien",
//     "Dermatologue",
//     "Dibetolgue",
//     "Urologue",
//     "Ophtalmologue",
//     "Cancerologue",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Menu(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Color(0xFFFFFFFF), // icône burger noir
//         ),
//         backgroundColor: Color(0xFF007BFF),
//         toolbarHeight: 100,
//         title: Text(
//           "liste des \ndepartements",
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
//                 padding: EdgeInsets.only(
//                   right: 10,
//                 ),
//                 child: ClipOval(
//                   child: UserMenu(),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(18),
//         child: Container(
//           width: 350,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 2,
//                   spreadRadius: 2,
//                   offset: Offset(1, 1),
//                 )
//               ]),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Column(
//                     children: departements
//                         .map((dpt) => (Column(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(10),
//                                   child: Row(
//                                     children: [
//                                       InkWell(
//                                         child: Container(
//                                           padding: EdgeInsets.all(12),
//                                           decoration: BoxDecoration(
//                                             color: const Color.fromARGB(
//                                                     255, 184, 157, 157)
//                                                 .withOpacity(0.1),
//                                           ),
//                                           child: Text(
//                                             dpt,
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 18),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                               ],
//                             )))
//                         .toList()),
//                 Column(
//                   children: [
//                     Container(
//                       child: ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF4CAF50),
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             (context),
//                             MaterialPageRoute(
//                                 builder: (context) => Ajouterdepartement()),
//                           );
//                         },
//                         icon: Icon(
//                           Icons.add,
//                           color: Color(0xFFFFFFFF),
//                         ),
//                         label: Text(
//                           "Ajouter un departement",
//                           style: TextStyle(color: Color(0xFFFFFFFF)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/departements/ajouterDepartement.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';
// ton fichier centralisé pour les appels API

class DepartementsPage extends StatefulWidget {
  @override
  _DepartementsPageState createState() => _DepartementsPageState();
}

class _DepartementsPageState extends State<DepartementsPage> {
  late Future<List<dynamic>> _departementsFuture;

  @override
  void initState() {
    super.initState();
    _loadDepartements();
  }

  void _loadDepartements() {
    setState(() {
      _departementsFuture = ApiMobileRv.getDepartements();
    });
  }

  // 👉 Ajouter département
  // void _ajouterDepartement() async {
  //   final TextEditingController _nomController = TextEditingController();

  //   await showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text("Ajouter un département"),
  //       content: TextField(
  //         controller: _nomController,
  //         decoration: InputDecoration(hintText: "Nom du département"),
  //       ),
  //       actions: [
  //         TextButton(
  //           child: Text("Annuler"),
  //           onPressed: () => Navigator.pop(context),
  //         ),
  //         ElevatedButton(
  //           child: Text("Ajouter"),
  //           onPressed: () async {
  //             if (_nomController.text.isNotEmpty) {
  //               bool success =
  //                   await ApiMobileRv.ajouterDepartement(_nomController.text);
  //               if (success) {
  //                 Navigator.pop(context);
  //                 _loadDepartements();
  //                 ScaffoldMessenger.of(context).showSnackBar(
  //                   SnackBar(content: Text("Département ajouté ✅")),
  //                 );
  //               }
  //             }
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // 👉 Modifier département
  void _modifierDepartement(int id, String nomActuel) async {
    final TextEditingController _nomController =
        TextEditingController(text: nomActuel);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Modifier le département"),
        content: TextField(
          controller: _nomController,
          decoration: InputDecoration(hintText: "Nouveau nom"),
        ),
        actions: [
          TextButton(
            child: Text("Annuler"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text("Modifier"),
            onPressed: () async {
              if (_nomController.text.isNotEmpty) {
                bool success = await ApiMobileRv.modifierDepartement(
                    id, _nomController.text);
                if (success) {
                  Navigator.pop(context);
                  _loadDepartements();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Département modifié ✅")),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  // 👉 Supprimer département
  void _supprimerDepartement(int id) async {
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmation"),
        content: Text("Voulez-vous vraiment supprimer ce département ?"),
        actions: [
          TextButton(
            child: Text("Non"),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(
            child: Text("Oui"),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirm == true) {
      bool success = await ApiMobileRv.supprimerDepartement(id);
      if (success) {
        _loadDepartements();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Département supprimé ✅")),
        );
      }
    }
  }

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
          "Listes des  \ndepartements",
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
      body: FutureBuilder<List<dynamic>>(
        future: _departementsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Aucun département trouvé"));
          }

          final departements = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: departements.map((dep) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text(dep['nom']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.yellow),
                          onPressed: () =>
                              _modifierDepartement(dep['id'], dep['nom']),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _supprimerDepartement(dep['id']),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Ajouterdepartement()));
          },
          label: Text(
            "Ajouter un departement",
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4CAF50),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}
