import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/rapports-admin/rapportsAdmin.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class ajouterUnRapport extends StatefulWidget {
  const ajouterUnRapport({super.key});

  @override
  State<ajouterUnRapport> createState() => _ajouterUnRapportState();
}

class _ajouterUnRapportState extends State<ajouterUnRapport> {
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
          "Ajouter un rapport",
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
        padding: EdgeInsets.all(
          16,
        ),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Type : ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Rendez-vous",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Plages de Date : ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "12/02/2025 - 12/05/2025",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Departement : ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Cardiologie",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description : ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Description",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black.withOpacity(0.2),
                        backgroundColor: Color(0xFF4CAF50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => rapportsAdmin()),
                      );
                    },
                    child: Text(
                      "Soumettre",
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [Text("Aucun rapport n a ete ajoute")],
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

// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';

// class AjouterUnRapportPage extends StatefulWidget {
//   const AjouterUnRapportPage({super.key});

//   @override
//   State<AjouterUnRapportPage> createState() => _AjouterUnRapportPageState();
// }

// class _AjouterUnRapportPageState extends State<AjouterUnRapportPage> {
//   final _formKey = GlobalKey<FormState>();
//   final descriptionController = TextEditingController();

//   String? selectedType;
//   DateTime? dateDebut;
//   DateTime? dateFin;
//   Map<String, dynamic>? selectedDepartement;
//   Map<String, dynamic>? selectedHopital;

//   List<Map<String, dynamic>> departements = [];
//   List<Map<String, dynamic>> hopitaux = [];

//   String token = "";
//   int? userId;

//   final DateFormat affichageDate = DateFormat('EEEE dd MMMM yyyy', 'fr_FR');

//   @override
//   void initState() {
//     super.initState();
//     _loadTokenAndData();
//   }

//   Future<void> _loadTokenAndData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       token = prefs.getString("jwt_token") ?? "";
//       userId = prefs.getInt("user_id");
//     });

//     departements = List<Map<String, dynamic>>.from(
//         await ApiMobileRv.getDepartements(token));
//     hopitaux =
//         List<Map<String, dynamic>>.from(await ApiMobileRv.getHopitaux(token));
//     setState(() {});
//   }

//   Future<void> _pickDate(BuildContext context, bool isDebut) async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2100),
//       locale: const Locale('fr', 'FR'),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isDebut) {
//           dateDebut = picked;
//         } else {
//           dateFin = picked;
//         }
//       });
//     }
//   }

//   Future<void> _submitRapport() async {
//     if (!_formKey.currentState!.validate() ||
//         selectedType == null ||
//         dateDebut == null ||
//         dateFin == null ||
//         userId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text("Veuillez remplir tous les champs obligatoires")),
//       );
//       return;
//     }

//     bool success = await ApiMobileRv().ajouterRapport(
//       token: token,
//       typeRapport: selectedType!,
//       dateDebut: dateDebut!.toIso8601String().split("T")[0],
//       dateFin: dateFin!.toIso8601String().split("T")[0],
//       description: descriptionController.text,
//       creePar: userId!,
//       departementId: selectedDepartement?['id'],
//       hopitalId: selectedHopital?['id'],
//     );

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Rapport ajouté avec succès ✅")),
//       );
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Erreur lors de l'ajout du rapport ❌")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Ajouter un rapport")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 // Type rapport
//                 DropdownButtonFormField<String>(
//                   value: selectedType,
//                   decoration: const InputDecoration(
//                     labelText: "Type de rapport",
//                     border: OutlineInputBorder(),
//                   ),
//                   items: [
//                     "rendez_vous",
//                     "statistiques",
//                     "consultations",
//                     "hopitaux",
//                     "departements",
//                     "activite"
//                   ]
//                       .map((type) => DropdownMenuItem(
//                             value: type,
//                             child: Text(type),
//                           ))
//                       .toList(),
//                   onChanged: (value) => setState(() => selectedType = value),
//                   validator: (value) => value == null ? "Type requis" : null,
//                 ),
//                 const SizedBox(height: 16),

//                 // Date début
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(dateDebut == null
//                         ? "Date début: non définie"
//                         : "Date début: ${affichageDate.format(dateDebut!)}"),
//                     ElevatedButton(
//                       onPressed: () => _pickDate(context, true),
//                       child: const Text("Choisir"),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),

//                 // Date fin
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(dateFin == null
//                         ? "Date fin: non définie"
//                         : "Date fin: ${affichageDate.format(dateFin!)}"),
//                     ElevatedButton(
//                       onPressed: () => _pickDate(context, false),
//                       child: const Text("Choisir"),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),

//                 // Département
//                 DropdownButtonFormField<Map<String, dynamic>>(
//                   value: selectedDepartement,
//                   decoration: const InputDecoration(
//                     labelText: "Département",
//                     border: OutlineInputBorder(),
//                   ),
//                   items: departements
//                       .map((dep) => DropdownMenuItem(
//                             value: dep,
//                             child: Text(dep['nom']),
//                           ))
//                       .toList(),
//                   onChanged: (value) =>
//                       setState(() => selectedDepartement = value),
//                 ),
//                 const SizedBox(height: 16),

//                 // Hôpital
//                 DropdownButtonFormField<Map<String, dynamic>>(
//                   value: selectedHopital,
//                   decoration: const InputDecoration(
//                     labelText: "Hôpital",
//                     border: OutlineInputBorder(),
//                   ),
//                   items: hopitaux
//                       .map((hop) => DropdownMenuItem(
//                             value: hop,
//                             child: Text(hop['nom']),
//                           ))
//                       .toList(),
//                   onChanged: (value) => setState(() => selectedHopital = value),
//                 ),
//                 const SizedBox(height: 16),

//                 // Description
//                 TextFormField(
//                   controller: descriptionController,
//                   maxLines: 4,
//                   decoration: const InputDecoration(
//                     labelText: "Description",
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) =>
//                       value!.isEmpty ? "Description requise" : null,
//                 ),
//                 const SizedBox(height: 24),

//                 ElevatedButton(
//                   onPressed: _submitRapport,
//                   child: const Text("Soumettre"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';
// import 'rapportsAdmin.dart';
// import '../menu/Menu.dart';
// import '../user-menu/userMenu.dart';

// class AjouterUnRapport extends StatefulWidget {
//   const AjouterUnRapport({super.key});

//   @override
//   State<AjouterUnRapport> createState() => _AjouterUnRapportState();
// }

// class _AjouterUnRapportState extends State<AjouterUnRapport> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController typeController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   String? selectedType;
//   DateTime? dateDebut;
//   DateTime? dateFin;
//   int? selectedDepartementId;
//   int? selectedHopitalId;

//   List<dynamic> _departements = [];
//   List<dynamic> _hopitaux = [];
//   String token = "";
//   int? userId;

//   final List<Map<String, String>> typesRapports = [
//     {"value": "rendez_vous", "label": "Rendez-vous"},
//     {"value": "statistiques", "label": "Statistiques"},
//     {"value": "consultations", "label": "Consultation"},
//     {"value": "hopitaux", "label": "Hopitaux"},
//     {"value": "departements", "label": "Departements"},
//     {"value": "activite", "label": "Activité"},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadTokenAndData();
//   }

//   Future<void> _loadTokenAndData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       token = prefs.getString("jwt_token") ?? "";
//       userId = prefs
//           .getInt("user_id"); // Assurez-vous d'avoir stocké l'id utilisateur
//     });

//     final departementsData = await ApiMobileRv.getDepartements(token);
//     final hopitauxData = await ApiMobileRv.getHopitaux(token);

//     setState(() {
//       _departements = departementsData;
//       _hopitaux = hopitauxData;
//     });
//   }

//   Future<void> _selectDate(BuildContext context, bool isDebut) async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2100),
//     );

//     if (picked != null) {
//       setState(() {
//         if (isDebut) {
//           dateDebut = picked;
//         } else {
//           dateFin = picked;
//         }
//       });
//     }
//   }

//   Future<void> _submitForm() async {
//     if (!_formKey.currentState!.validate() ||
//         dateDebut == null ||
//         dateFin == null ||
//         selectedType == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Veuillez remplir tous les champs")),
//       );
//       return;
//     }

//     bool success = await ApiMobileRv.ajouterRapport(
//       token: token,
//       typeRapport: selectedType!,
//       dateDebut: DateFormat('yyyy-MM-dd').format(dateDebut!),
//       dateFin: DateFormat('yyyy-MM-dd').format(dateFin!),
//       description: descriptionController.text,
//       creePar: userId!,
//       departementId: selectedDepartementId,
//       hopitalId: selectedHopitalId,
//     );

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Rapport ajouté avec succès ✅")),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => rapportsAdmin()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Erreur lors de la création du rapport ❌")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Menu(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Color(0xFF007BFF),
//         toolbarHeight: 100,
//         title: Text(
//           "Ajouter un rapport",
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           Container(
//             padding: EdgeInsets.only(right: 10),
//             child: ClipOval(child: UserMenu()),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: _departements.isEmpty || _hopitaux.isEmpty
//             ? Center(child: CircularProgressIndicator())
//             : SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Type de rapport
//                       Text("Type de rapport",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       DropdownButtonFormField<String>(
//                         value: selectedType,
//                         hint: Text("Sélectionner un type"),
//                         onChanged: (value) =>
//                             setState(() => selectedType = value),
//                         items: typesRapports.map((type) {
//                           return DropdownMenuItem(
//                             value: type["value"],
//                             child: Text(type["label"]!),
//                           );
//                         }).toList(),
//                         validator: (value) =>
//                             value == null ? "Type requis" : null,
//                       ),
//                       SizedBox(height: 16),

//                       // Date début
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(dateDebut == null
//                               ? "Date début: Non définie"
//                               : "Date début: ${DateFormat('yyyy-MM-dd').format(dateDebut!)}"),
//                           ElevatedButton(
//                             onPressed: () => _selectDate(context, true),
//                             child: Text("Choisir"),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 16),

//                       // Date fin
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(dateFin == null
//                               ? "Date fin: Non définie"
//                               : "Date fin: ${DateFormat('yyyy-MM-dd').format(dateFin!)}"),
//                           ElevatedButton(
//                             onPressed: () => _selectDate(context, false),
//                             child: Text("Choisir"),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 16),

//                       // Département
//                       Text("Département",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       DropdownButtonFormField<int>(
//                         value: selectedDepartementId,
//                         hint: Text("Sélectionner un département"),
//                         onChanged: (value) =>
//                             setState(() => selectedDepartementId = value),
//                         items: _departements.map<DropdownMenuItem<int>>((dep) {
//                           return DropdownMenuItem<int>(
//                             value: dep['id'] as int,
//                             child: Text(dep['nom'] ?? ""),
//                           );
//                         }).toList(),
//                       ),
//                       SizedBox(height: 16),

//                       // Hopital
//                       Text("Hopital",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       DropdownButtonFormField<int>(
//                         value: selectedHopitalId,
//                         hint: Text("Sélectionner un hopital"),
//                         onChanged: (value) =>
//                             setState(() => selectedHopitalId = value),
//                         items: _hopitaux.map<DropdownMenuItem<int>>((hop) {
//                           return DropdownMenuItem<int>(
//                             value: hop['id'] as int,
//                             child: Text(hop['nom'] ?? ""),
//                           );
//                         }).toList(),
//                       ),
//                       SizedBox(height: 16),

//                       // Description
//                       Text("Description",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       TextFormField(
//                         controller: descriptionController,
//                         maxLines: 4,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                         validator: (value) =>
//                             value!.isEmpty ? "Description requise" : null,
//                       ),
//                       SizedBox(height: 24),

//                       Center(
//                         child: ElevatedButton(
//                           onPressed: _submitForm,
//                           child: Text("Soumettre"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../menu/Menu.dart';
// import '../user-menu/userMenu.dart';

// class AjouterUnRapport extends StatefulWidget {
//   const AjouterUnRapport({Key? key}) : super(key: key);

//   @override
//   State<AjouterUnRapport> createState() => _AjouterUnRapportState();
// }

// class _AjouterUnRapportState extends State<AjouterUnRapport> {
//   final _formKey = GlobalKey<FormState>();

//   // Controllers
//   final TextEditingController descriptionController = TextEditingController();

//   // Dropdown selections
//   String? selectedType;
//   int? selectedDepartementId;
//   int? selectedHopitalId;

//   // Dates
//   DateTime? dateDebut;
//   DateTime? dateFin;

//   // Token
//   String token = "";

//   // Futures pour dropdown
//   late Future<List<dynamic>> departementsFuture;
//   late Future<List<dynamic>> hopitauxFuture;

//   final List<Map<String, String>> typesRapport = [
//     {"value": "rendez_vous", "label": "Rendez-vous"},
//     {"value": "statistiques", "label": "Statistiques"},
//     {"value": "consultations", "label": "Consultation"},
//     {"value": "hopitaux", "label": "Hopitaux"},
//     {"value": "departements", "label": "Departements"},
//     {"value": "activite", "label": "Activité"},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadTokenAndData();
//   }

//   Future<void> _loadTokenAndData() async {
//     final prefs = await SharedPreferences.getInstance();
//     token = prefs.getString("jwt_token") ?? "";
//     setState(() {
//       departementsFuture = ApiMobileRv.getDepartements(token);
//       hopitauxFuture = ApiMobileRv.getHopitaux(token);
//     });
//   }

//   Future<void> _pickDate(BuildContext context, bool isDebut) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isDebut) {
//           dateDebut = picked;
//         } else {
//           dateFin = picked;
//         }
//       });
//     }
//   }

//   Future<void> _submitRapport() async {
//     if (!_formKey.currentState!.validate() ||
//         dateDebut == null ||
//         dateFin == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Veuillez remplir tous les champs")),
//       );
//       return;
//     }

//     // Récupérer l'id de l'utilisateur depuis le token ou SharedPreferences si besoin
//     final prefs = await SharedPreferences.getInstance();
//     final creePar = prefs.getInt("user_id") ?? 1;

//     bool success = await ApiMobileRv().ajouterRapport(
//       token: token,
//       typeRapport: selectedType!,
//       dateDebut: DateFormat('yyyy-MM-dd').format(dateDebut!),
//       dateFin: DateFormat('yyyy-MM-dd').format(dateFin!),
//       description: descriptionController.text,
//       creePar: creePar,
//       departementId: selectedDepartementId,
//       hopitalId: selectedHopitalId,
//     );

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Rapport ajouté avec succès ✅")),
//       );
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Erreur lors de l'ajout du rapport ❌")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Menu(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Color(0xFF007BFF),
//         title: Text("Ajouter un rapport"),
//         actions: [UserMenu()],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 // Type de rapport
//                 DropdownButtonFormField<String>(
//                   value: selectedType,
//                   hint: Text("Sélectionner le type de rapport"),
//                   items: typesRapport
//                       .map((t) => DropdownMenuItem<String>(
//                             value: t['value'],
//                             child: Text(t['label']!),
//                           ))
//                       .toList(),
//                   onChanged: (value) => setState(() => selectedType = value),
//                   validator: (value) => value == null ? "Champ requis" : null,
//                 ),
//                 SizedBox(height: 16),

//                 // Date début
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(dateDebut == null
//                         ? "Date début : Non définie"
//                         : "Date début : ${DateFormat('dd/MM/yyyy').format(dateDebut!)}"),
//                     ElevatedButton(
//                         onPressed: () => _pickDate(context, true),
//                         child: Text("Choisir"))
//                   ],
//                 ),
//                 SizedBox(height: 16),

//                 // Date fin
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(dateFin == null
//                         ? "Date fin : Non définie"
//                         : "Date fin : ${DateFormat('dd/MM/yyyy').format(dateFin!)}"),
//                     ElevatedButton(
//                         onPressed: () => _pickDate(context, false),
//                         child: Text("Choisir"))
//                   ],
//                 ),
//                 SizedBox(height: 16),

//                 // Département
//                 FutureBuilder<List<dynamic>>(
//                   future: departementsFuture,
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) return CircularProgressIndicator();
//                     return DropdownButtonFormField<int>(
//                       value: selectedDepartementId,
//                       hint: Text("Sélectionner un département"),
//                       items: snapshot.data!.map<DropdownMenuItem<int>>((dep) {
//                         return DropdownMenuItem<int>(
//                           value: dep['id'],
//                           child: Text(dep['nom']),
//                         );
//                       }).toList(),
//                       onChanged: (value) =>
//                           setState(() => selectedDepartementId = value),
//                       validator: (value) =>
//                           value == null ? "Champ requis" : null,
//                     );
//                   },
//                 ),
//                 SizedBox(height: 16),

//                 // Hopital
//                 FutureBuilder<List<dynamic>>(
//                   future: hopitauxFuture,
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) return CircularProgressIndicator();
//                     return DropdownButtonFormField<int>(
//                       value: selectedHopitalId,
//                       hint: Text("Sélectionner un hôpital"),
//                       items: snapshot.data!.map<DropdownMenuItem<int>>((hop) {
//                         return DropdownMenuItem<int>(
//                           value: hop['id'],
//                           child: Text(hop['nom']),
//                         );
//                       }).toList(),
//                       onChanged: (value) =>
//                           setState(() => selectedHopitalId = value),
//                       validator: (value) =>
//                           value == null ? "Champ requis" : null,
//                     );
//                   },
//                 ),
//                 SizedBox(height: 16),

//                 // Description
//                 TextFormField(
//                   controller: descriptionController,
//                   maxLines: 4,
//                   decoration: InputDecoration(
//                       hintText: "Description",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   validator: (value) =>
//                       value == null || value.isEmpty ? "Champ requis" : null,
//                 ),
//                 SizedBox(height: 24),

//                 ElevatedButton(
//                   onPressed: _submitRapport,
//                   child: Text("Soumettre"),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF4CAF50)),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
