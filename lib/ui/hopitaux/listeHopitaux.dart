// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/ui/hopitaux/ajouteHopitaux.dart';
// import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
// import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

// class Hopital {
//   final String nom;
//   final String adresse;
//   final String logo;

//   Hopital({required this.nom, required this.adresse, required this.logo});
// }

// class listeHopitaux extends StatefulWidget {
//   const listeHopitaux({super.key});

//   @override
//   State<listeHopitaux> createState() => _listeHopitauxState();
// }

// class _listeHopitauxState extends State<listeHopitaux> {
//   final List<Hopital> hopitaux = [
//     Hopital(
//         nom: "Hopital Fann",
//         adresse: "Fann Dakar universitaire",
//         logo: "assets/images/fannun.png"),
//     Hopital(
//         nom: "Hopital de Ourrosogui",
//         adresse: "Matam OurrosoguiFouta",
//         logo: "assets/images/ourro.png"),
//     Hopital(
//         nom: "Hopital Regional de saint louis",
//         adresse: "Saint Louis Pikine",
//         logo: "assets/images/stlouis.png"),
//     Hopital(
//         nom: "Hopital Dalal Jam",
//         adresse: "Guediawaye BRT",
//         logo: "assets/images/dalaljam.png"),
//     Hopital(
//         nom: "Hopital de Keur Massar",
//         adresse: "Keur Massar Unite 5 Sapeur",
//         logo: "assets/images/km.png"),
//     Hopital(
//         nom: "Hopital Militaire de Ouakam",
//         adresse: "1 km rond Point Mermoz",
//         logo: "assets/images/ouakam.png"),
//     Hopital(
//         nom: "Hopital de Diamniadio",
//         adresse: "Diamniadio en face Dakar Arene",
//         logo: "assets/images/diamniadio.png"),
//     Hopital(
//         nom: "Hopital Principale",
//         adresse: "Dakar Plateau Quatier",
//         logo: "assets/images/principal.png"),
//     Hopital(
//         nom: "Hopital Aristic le Dentec",
//         adresse: "Dakar route de Palais",
//         logo: "assets/images/dentec.png"),
//     Hopital(
//         nom: "Hopital Idrissa Pouye de Grand Yoff",
//         adresse: "Grand Yoff, Dakar",
//         logo: "assets/images/grandyoff.png"),
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
//           "liste des hopitaux \ndisponibles",
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
//           Expanded(
//             child: ListView.builder(
//               itemCount: hopitaux.length,
//               itemBuilder: (context, index) {
//                 final hopital = hopitaux[index];
//                 return ListTile(
//                   leading: Image.asset(
//                     hopital.logo,
//                     width: 100,
//                     height: 100,
//                   ),
//                   title: Text(hopital.nom),
//                   subtitle: Text(hopital.adresse),
//                   onTap: () {
//                     // Action à la sélection
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF4CAF50),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   (context),
//                   MaterialPageRoute(builder: (context) => Ajoutehopitaux()),
//                 );
//               },
//               icon: Icon(
//                 Icons.add,
//                 color: Color(0xFFFFFFFF),
//               ),
//               label: Text(
//                 "Ajouter un hôpital",
//                 style: TextStyle(color: Color(0xFFFFFFFF)),
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
import 'package:shared_preferences/shared_preferences.dart';

class HopitauxPage extends StatefulWidget {
  const HopitauxPage({super.key});

  @override
  State<HopitauxPage> createState() => _HopitauxPageState();
}

class _HopitauxPageState extends State<HopitauxPage> {
  String token = "";
  List<dynamic> _hopitaux = [];
  List<dynamic> _departements = [];
  bool _isLoading = true;

  int? selectedDepartementId;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final t = prefs.getString('jwt_token') ?? "";
    setState(() => token = t);

    if (token.isNotEmpty) {
      final hopitauxData = await ApiMobileRv.getHopitaux();
      final departementsData = await ApiMobileRv.getDepartements();

      setState(() {
        _hopitaux = hopitauxData;
        _departements = departementsData;
        _isLoading = false;
      });
    }
  }

  void _showHopitalDialog({Map<String, dynamic>? hopital}) {
    final nomController = TextEditingController(text: hopital?['nom'] ?? "");
    final adresseController =
        TextEditingController(text: hopital?['adresse'] ?? "");
    int? departementId = hopital?['departement'] ?? selectedDepartementId;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title:
            Text(hopital == null ? "Ajouter un hôpital" : "Modifier l'hôpital"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomController,
              decoration: InputDecoration(labelText: "Nom"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: adresseController,
              decoration: InputDecoration(labelText: "Adresse"),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<int>(
              value: departementId,
              decoration: InputDecoration(labelText: "Département"),
              items: _departements.map<DropdownMenuItem<int>>((d) {
                return DropdownMenuItem<int>(
                  value: d['id'],
                  child: Text(d['nom']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => departementId = value);
              },
              validator: (value) => value == null ? "Champ requis" : null,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (nomController.text.isNotEmpty &&
                  adresseController.text.isNotEmpty &&
                  departementId != null) {
                bool success;
                if (hopital == null) {
                  success = await ApiMobileRv.createHopital(
                    nomController.text,
                    adresseController.text,
                    departementId!,
                  );
                } else {
                  success = await ApiMobileRv.updateHopital(
                    hopital['id'],
                    nomController.text,
                    adresseController.text,
                    departementId!,
                  );
                }

                if (success) {
                  Navigator.pop(context);
                  _loadData();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Erreur lors de l'opération")),
                  );
                }
              }
            },
            child: Text(hopital == null ? "Ajouter" : "Modifier"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Annuler"),
          ),
        ],
      ),
    );
  }

  void _deleteHopital(int hopitalId) async {
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
      final success = await ApiMobileRv.deleteHopital(hopitalId);
      if (success) {
        _loadData();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur lors de la suppression")),
        );
      }
    }
  }

  // void _deleteHopital(int hopitalId) async {

  //   final success = await ApiMobileRv.deleteHopital(hopitalId);
  //   if (success) {
  //     _loadData();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Erreur lors de la suppression")),
  //     );
  //   }
  // }

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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _hopitaux.length,
                    itemBuilder: (context, index) {
                      final hop = _hopitaux[index];
                      return ListTile(
                        leading: ClipRRect(
                          child: Image.asset(
                            "assets/images/diamniadio.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(hop['nom']),
                        subtitle: Text("Adresse: ${hop['adresse']}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.yellow),
                              onPressed: () => _showHopitalDialog(hopital: hop),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteHopital(hop['id']),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4CAF50),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () => _showHopitalDialog(),
                    child: Text(
                      "Ajouter un hôpital",
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
