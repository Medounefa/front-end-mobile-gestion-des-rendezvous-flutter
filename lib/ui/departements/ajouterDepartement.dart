// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/ui/departements/departementsDispo.dart';
// import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
// import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

// class ajoutDepartement extends StatefulWidget {
//   const ajoutDepartement({super.key});

//   @override
//   State<ajoutDepartement> createState() => _ajoutDepartementState();
// }

// class _ajoutDepartementState extends State<ajoutDepartement> {
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
//           "Ajouter un \ndepartement",
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
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(18),
//             child: Container(
//               padding: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 1,
//                       offset: Offset(1, 1)),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         "Nom du departement : ",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 17),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "Nom du departement",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: Color(0xFF4CAF50),
//                             shadowColor: Colors.black.withOpacity(0.1),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               (context),
//                               MaterialPageRoute(
//                                   builder: (context) => departementsDispo()),
//                             );
//                           },
//                           child: Text(
//                             "Ajouter",
//                             style: TextStyle(color: Color(0xFFFFFFFF)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class Ajouterdepartement extends StatefulWidget {
  @override
  _AjouterdepartementState createState() => _AjouterdepartementState();
}

class _AjouterdepartementState extends State<Ajouterdepartement> {
  final TextEditingController _nomController = TextEditingController();

  void _saveDepartement() async {
    bool success = await ApiMobileRv.ajouterDepartement(
      _nomController.text,
    );
    if (success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Département ajouté")));
      _nomController.clear();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erreur")));
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
          "Ajouter un \ndepartement",
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
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: InputDecoration(
                hintText: "Nom du département",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4CAF50),
              ),
              onPressed: _saveDepartement,
              icon: Icon(
                Icons.add,
                color: Color(0xFFFFFFFF),
              ),
              label: Text(
                "Ajouter un departement",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
