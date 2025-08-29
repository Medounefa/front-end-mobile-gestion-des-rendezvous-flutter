// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/ui/disponibiltes-calendrier/listeDisponibilitesCalendrier.dart';
// import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
// import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';
// import 'package:table_calendar/table_calendar.dart';

// class AjouterDisponibiliteCalendrier extends StatefulWidget {
//   @override
//   _AjouterDisponibiliteCalendrierState createState() =>
//       _AjouterDisponibiliteCalendrierState();
// }

// class _AjouterDisponibiliteCalendrierState
//     extends State<AjouterDisponibiliteCalendrier> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   Map<DateTime, List<String>> _disponibilites = {};

//   List<String> heures = [
//     '09:00',
//     '10:00',
//     '11:00',
//     '14:00',
//     '15:00',
//     '16:00',
//   ];

//   List<String> _selectedHeures = [];

//   // void _ajouterDisponibilite() {
//   //   if (_selectedDay != null && _selectedHeures.isNotEmpty) {
//   //     final key =
//   //         DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day);
//   //     setState(() {
//   //       _disponibilites[key] = [..._selectedHeures];
//   //       _selectedHeures = [];
//   //     });
//   //   }
//   // }

//   Widget _buildHeuresCheckboxes() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: heures.map((heure) {
//         return CheckboxListTile(
//           title: Text(heure),
//           value: _selectedHeures.contains(heure),
//           onChanged: (bool? selected) {
//             setState(() {
//               if (selected == true) {
//                 _selectedHeures.add(heure);
//               } else {
//                 _selectedHeures.remove(heure);
//               }
//             });
//           },
//         );
//       }).toList(),
//     );
//   }

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
//           "Ajouter une \nDisponibilite",
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
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Medecin : ",
//                     style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "Selection le medecins",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             TableCalendar(
//               locale: 'fr_FR',
//               firstDay: DateTime.utc(2024, 1, 1),
//               lastDay: DateTime.utc(2030, 12, 31),
//               focusedDay: _focusedDay,
//               selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   _selectedDay = selectedDay;
//                   _focusedDay = focusedDay;
//                   _selectedHeures = _disponibilites[selectedDay] ?? [];
//                 });
//               },
//               calendarStyle: CalendarStyle(
//                 selectedDecoration: BoxDecoration(
//                   color: Colors.green,
//                   shape: BoxShape.circle,
//                 ),
//                 todayDecoration: BoxDecoration(
//                   color: Colors.blue,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Sélectionne les heures pour ${_selectedDay != null ? "${_selectedDay!.day}/${_selectedDay!.month}" : "un jour"}',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             _buildHeuresCheckboxes(),
//             SizedBox(height: 10),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF4CAF50),
//                 shadowColor: Colors.black.withOpacity(0.1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   (context),
//                   MaterialPageRoute(
//                       builder: (context) => listeDisponibilitesCalendrier()),
//                 );
//               },
//               child: Text(
//                 'Ajouter la disponibilité',
//                 style: TextStyle(color: Color(0xFFFFFFFF)),
//               ),
//             ),
//             Divider(height: 30),
//             // Text(
//             //   'Disponibilités enregistrées :',
//             //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             // ),
//             ..._disponibilites.entries.map((entry) {
//               final date = entry.key;
//               final heures = entry.value;
//               return ListTile(
//                 title: Text('${date.day}/${date.month}/${date.year}'),
//                 subtitle: Text('Heures : ${heures.join(", ")}'),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';

// class AjouterDisponibiliteCalendrierPage extends StatefulWidget {
//   final String token; // On passe le token JWT du médecin connecté

//   AjouterDisponibiliteCalendrierPage({required this.token});

//   @override
//   _AjouterDisponibiliteCalendrierPageState createState() =>
//       _AjouterDisponibiliteCalendrierPageState();
// }

// class _AjouterDisponibiliteCalendrierPageState
//     extends State<AjouterDisponibiliteCalendrierPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _jour = "";
//   String _heureDebut = "";
//   String _heureFin = "";

//   final List<String> jours = [
//     "Lundi",
//     "Mardi",
//     "Mercredi",
//     "Jeudi",
//     "Vendredi",
//     "Samedi",
//     "Dimanche"
//   ];

//   Future<void> _submit() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       try {
//         await ApiMobileRv.ajouterDisponibilite(
//           widget.token,
//           _jour,
//           _heureDebut,
//           _heureFin,
//         );

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Disponibilité ajoutée avec succès")),
//         );

//         Navigator.pop(context); // Retour à la page précédente
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Erreur: $e")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Ajouter une disponibilité")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // Sélection du jour
//               DropdownButtonFormField<String>(
//                 value: _jour.isNotEmpty ? _jour : null,
//                 decoration: InputDecoration(labelText: "Jour"),
//                 items: jours
//                     .map((j) => DropdownMenuItem(value: j, child: Text(j)))
//                     .toList(),
//                 onChanged: (val) {
//                   setState(() {
//                     _jour = val!;
//                   });
//                 },
//                 validator: (value) => value == null || value.isEmpty
//                     ? "Sélectionnez un jour"
//                     : null,
//               ),

//               // Heure début
//               TextFormField(
//                 decoration: InputDecoration(labelText: "Heure début (HH:MM)"),
//                 validator: (value) =>
//                     value!.isEmpty ? "Entrez une heure de début" : null,
//                 onSaved: (value) => _heureDebut = value!,
//               ),

//               // Heure fin
//               TextFormField(
//                 decoration: InputDecoration(labelText: "Heure fin (HH:MM)"),
//                 validator: (value) =>
//                     value!.isEmpty ? "Entrez une heure de fin" : null,
//                 onSaved: (value) => _heureFin = value!,
//               ),

//               SizedBox(height: 20),

//               ElevatedButton(
//                 onPressed: _submit,
//                 child: Text("Ajouter"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AjouterDisponibilitePage extends StatefulWidget {
  const AjouterDisponibilitePage({Key? key}) : super(key: key);

  @override
  State<AjouterDisponibilitePage> createState() =>
      _AjouterDisponibilitePageState();
}

class _AjouterDisponibilitePageState extends State<AjouterDisponibilitePage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedJour;
  TimeOfDay? heureDebut;
  TimeOfDay? heureFin;
  DateTime? selectedDate;

  String token = "";

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("jwt_token") ?? "";
    });
  }

  Future<void> _ajouterDisponibilite() async {
    if (!_formKey.currentState!.validate() ||
        heureDebut == null ||
        heureFin == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
      return;
    }

    final dateFormat = DateFormat("HH:mm");

    try {
      final response = await ApiMobileRv().addDisponibilite(
        token: token,
        date: selectedDate != null
            ? "${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}"
            : "",
        heureDebut: dateFormat
            .format(DateTime(2023, 1, 1, heureDebut!.hour, heureDebut!.minute)),
        heureFin: dateFormat
            .format(DateTime(2023, 1, 1, heureFin!.hour, heureFin!.minute)),
      );

      print("Réponse API: $response"); // ✅ Debug

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Disponibilité ajoutée avec succès")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur : $e")),
      );
    }
  }

  Future<void> _selectTime(BuildContext context, bool isDebut) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        if (isDebut) {
          heureDebut = picked;
        } else {
          heureFin = picked;
        }
      });
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
          "Ajouter \nDisponibilite",
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Sélection du jour
              // DropdownButtonFormField<String>(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              //   value: selectedJour,
              //   hint: Text("Sélectionner un jour"),
              //   onChanged: (value) {
              //     setState(() {
              //       selectedJour = value;
              //     });
              //   },
              //   items: [
              //     "Lundi",
              //     "Mardi",
              //     "Mercredi",
              //     "Jeudi",
              //     "Vendredi",
              //     "Samedi",
              //     "Dimanche"
              //   ].map((jour) {
              //     return DropdownMenuItem(
              //       value: jour,
              //       child: Text(jour),
              //     );
              //   }).toList(),
              //   validator: (value) => value == null ? "Jour requis" : null,
              // ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                child: Text(selectedDate == null
                    ? "Choisir une date"
                    : "${selectedDate!.toLocal()}".split(' ')[0]),
              ),
              SizedBox(
                height: 20,
              ),

              // Heure début
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(heureDebut == null
                      ? "Heure début: Non définie"
                      : "Heure début: ${heureDebut!.format(context)}"),
                  ElevatedButton(
                    onPressed: () => _selectTime(context, true),
                    child: Text("Choisir"),
                  )
                ],
              ),

              SizedBox(height: 20),

              // Heure fin
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(heureFin == null
                      ? "Heure fin: Non définie"
                      : "Heure fin: ${heureFin!.format(context)}"),
                  ElevatedButton(
                    onPressed: () => _selectTime(context, false),
                    child: Text("Choisir"),
                  )
                ],
              ),

              SizedBox(height: 30),

              // Bouton ajouter
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4CAF50),
                  shadowColor: Colors.black.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: _ajouterDisponibilite,
                child: Text(
                  "Ajouter ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
