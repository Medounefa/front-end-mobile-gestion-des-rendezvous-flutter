// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/ui/creneaux-disponibles/CreneauxDisponibles.dart';
// import 'package:gestiondesrendezvoushopitals/ui/list-Medecin-Pour-Patient/listMedecinPourPatient.dart';
// import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
// import 'package:gestiondesrendezvoushopitals/ui/prise-de-rendez-vous/HistoriqueRendezVousPourPatients.dart';
// import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';
// import 'package:intl/intl.dart';

// class PriseDeRendezVous extends StatefulWidget {
//   const PriseDeRendezVous({super.key});

//   @override
//   State<PriseDeRendezVous> createState() => _PriseDeRendezVousState();
// }

// class _PriseDeRendezVousState extends State<PriseDeRendezVous> {
//   DateTime selectedDate = DateTime.now();

//   void _previousDate() {
//     setState(() {
//       selectedDate = selectedDate.subtract(Duration(days: 1));
//     });
//   }

//   void _nextDate() {
//     setState(() {
//       selectedDate = selectedDate.add(Duration(days: 1));
//     });
//   }

//   void _showConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           child: AlertDialog(
//             // content: Text('Rendez-vous pris avec succes'),
//             actions: [
//               // Text("Rendez-vous pris avec succes"),
//               // TextButton(
//               //   child: Text('Annuler'),
//               //   onPressed: () {
//               //     Navigator.of(context).pop(); // Fermer le popup
//               //   },
//               // ),
//               // TextButton(
//               //   child: Text('Oui'),
//               //   onPressed: () {
//               //     Navigator.of(context).pop(); // Fermer
//               //     // 👉 Action à exécuter
//               //     print('Action confirmée');
//               //   },
//               // ),
//               Container(
//                 padding: EdgeInsets.only(left: 200),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.transparent,
//                       elevation: 0,
//                       shadowColor: Colors.transparent,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero)),
//                   onPressed: () {
//                     Navigator.push(
//                         (context),
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 HistoriqueRendezVousPourPatients()));
//                   },
//                   child: Text("x"),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(bottom: 20),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           "assets/images/right.png",
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         )
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Rendez-vous pris avec succes"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     String formattedDate =
//         DateFormat('EEEE d MMMM yyyy', 'fr_FR').format(selectedDate).toString();

//     return Scaffold(
//       drawer: Menu(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Color(0xFFFFFFFF), // icône burger noir
//         ),
//         backgroundColor: Color(0xFF007BFF),
//         toolbarHeight: 100,
//         title: Text(
//           "Prendre un \nrendez-vous \navec le medecin",
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
//                   child: UserMenu(),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(top: 10),
//           child: Column(
//             children: [
//               Center(
//                 child: Column(
//                   children: [
//                     ClipOval(
//                       child: Image.asset(
//                         "assets/images/med1.jpg",
//                         width: 100,
//                         height: 100,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Text(
//                       "Dr Medoune Fall",
//                       style: TextStyle(
//                         fontFamily: "poppins",
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Color(0xFF212121),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Center(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Specialte : ",
//                             style: TextStyle(
//                                 fontFamily: "poppins",
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xFF212121),
//                                 fontSize: 17),
//                           ),
//                           Text(
//                             "Cardiologue",
//                             style: TextStyle(
//                                 fontFamily: "poppins",
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 17),
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.place),
//                           Text(
//                             "Hopital Fann",
//                             style: TextStyle(
//                                 fontFamily: "poppins",
//                                 fontWeight: FontWeight.w700,
//                                 color: Color(0xFF212121),
//                                 fontSize: 20),
//                           ),
//                         ],
//                       ),
//                       Center(
//                         child: Container(
//                           width: 300,
//                           child: Divider(
//                             color: Colors.black,
//                             thickness: 2,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             Text(
//                               "Selectionnez une date",
//                               style: TextStyle(
//                                   fontFamily: "poppins",
//                                   fontWeight: FontWeight.w700,
//                                   color: Color(0xFF212121),
//                                   fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.chevron_left),
//                                 onPressed: _previousDate,
//                               ),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 8),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.grey),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   formattedDate,
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.chevron_right),
//                                 onPressed: _nextDate,
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             'Choisissez votre créneau',
//                             style: TextStyle(
//                                 fontFamily: "poppins",
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF212121),
//                                 fontSize: 18),
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 child: CreneauxDisponibles(),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 "Motif de consultation",
//                                 style: TextStyle(
//                                     fontFamily: "poppins",
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFF212121),
//                                     fontSize: 18),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.fromLTRB(20, 2, 20, 10),
//                                 child: TextFormField(
//                                   maxLines: 3, // or use `null` for unlimited
//                                   decoration: InputDecoration(
//                                     labelText: 'Description',
//                                     border: OutlineInputBorder(),
//                                   ),
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter some text';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                               Container(
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Color(0xFF4CAF50),
//                                     shadowColor: Colors.transparent,
//                                     elevation: 0,
//                                     shape: RoundedRectangleBorder(
//                                         side: BorderSide.none,
//                                         borderRadius: BorderRadius.circular(5)),
//                                   ),
//                                   onPressed: () =>
//                                       _showConfirmationDialog(context),
//                                   child: Text(
//                                     "Confirmer",
//                                     style: TextStyle(color: Color(0xFFFFFFFF)),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
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
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PriseDeRendezVous extends StatefulWidget {
  final String token;
  final String userRole; // "patient" ou "secretaire"

  const PriseDeRendezVous({
    required this.token,
    required this.userRole,
    Key? key,
  }) : super(key: key);

  @override
  _PriseDeRendezVousState createState() => _PriseDeRendezVousState();
}

class _PriseDeRendezVousState extends State<PriseDeRendezVous> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _descriptionController = TextEditingController();
  final _medecinController = TextEditingController();
  final _patientController = TextEditingController();
  final _hopitalController =
      TextEditingController(); // seulement pour secrétaire

  bool _isLoading = false;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 9, minute: 0),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez choisir la date et l'heure")),
      );
      return;
    }

    final dateFormatted = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    final heureFormatted = _selectedTime!.format(context);

    final Map<String, dynamic> appointmentData = {
      "date": dateFormatted,
      "heure": heureFormatted,
      "medecin": int.parse(_medecinController.text),
      "description": _descriptionController.text,
      "hopital": _hopitalController.text,
      "patient": _patientController.text,
    };

    // Si secrétaire → on ajoute patient
    if (widget.userRole == "secretaire") {
      appointmentData["patient"] = int.parse(_patientController.text);
    }

    setState(() => _isLoading = true);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token') ?? '';
    final success =
        await ApiMobileRv().priseDeRendezVous(token, appointmentData);
    setState(() => _isLoading = false);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Rendez-vous créé avec succès ✅")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de la création du rendez-vous ❌")),
      );
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
          "Creer un \nrendez-vous",
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
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Date picker
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: _pickDate,
                validator: (_) =>
                    _selectedDate == null ? "Choisissez une date" : null,
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                      : '',
                ),
              ),

              SizedBox(height: 16),

              // Time picker
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Heure",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.access_time),
                ),
                onTap: _pickTime,
                validator: (_) =>
                    _selectedTime == null ? "Choisissez une heure" : null,
                controller: TextEditingController(
                  text: _selectedTime != null
                      ? _selectedTime!.format(context)
                      : '',
                ),
              ),

              SizedBox(height: 16),

              // Médecin ID
              TextFormField(
                controller: _medecinController,
                decoration: InputDecoration(
                  labelText: "ID Médecin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Entrez l'ID du médecin" : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _hopitalController,
                decoration: InputDecoration(
                  labelText: "Id hopital",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Entrez l'ID de l'hopital" : null,
              ),

              SizedBox(height: 16),

              // Patient ID uniquement si secrétaire
              if (widget.userRole == "secretaire") ...[
                TextFormField(
                  controller: _patientController,
                  decoration: InputDecoration(
                    labelText: "ID Patient",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? "Entrez l'ID du patient" : null,
                ),
              ],
              SizedBox(height: 16),
              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? "Entrez une description" : null,
              ),

              SizedBox(height: 24),

              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: Text("Créer le rendez-vous"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
// import 'package:intl/intl.dart';

// class PriseDeRendezVous extends StatefulWidget {
//   final String token;
//   final String userRole; // "patient" ou "secretaire"

//   const PriseDeRendezVous({
//     required this.token,
//     required this.userRole,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _PriseDeRendezVousState createState() => _PriseDeRendezVousState();
// }

// class _PriseDeRendezVousState extends State<PriseDeRendezVous> {
//   final _formKey = GlobalKey<FormState>();

//   DateTime? _selectedDate;
//   TimeOfDay? _selectedTime;

//   // Dropdown selections
//   int? _selectedMedecinId;
//   int? _selectedPatientId;

//   bool _isLoading = false;

//   List<Map<String, dynamic>> medecins = [];
//   List<Map<String, dynamic>> patients = [];

//   final _descriptionController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadUsers();
//   }

//   Future<void> _loadUsers() async {
//     // Charge la liste des médecins
//     final medecinsList =
//         await ApiMobileRv().fetchUsersByRole(widget.token, "medecin");
//     List<Map<String, dynamic>> patientsList = [];

//     if (widget.userRole == "secretaire") {
//       // Charge aussi la liste des patients uniquement si secrétaire
//       patientsList =
//           (await ApiMobileRv().fetchUsersByRole(widget.token, "patient"))!;
//     }

//     setState(() {
//       medecins = medecinsList ?? [];
//       patients = patientsList;
//     });
//   }

//   Future<void> _pickDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now().add(Duration(days: 1)),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) setState(() => _selectedDate = picked);
//   }

//   Future<void> _pickTime() async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay(hour: 9, minute: 0),
//     );
//     if (picked != null) setState(() => _selectedTime = picked);
//   }

//   Future<void> _submitForm() async {
//     if (!_formKey.currentState!.validate()) return;

//     if (_selectedDate == null || _selectedTime == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Veuillez choisir la date et l'heure")),
//       );
//       return;
//     }

//     if (_selectedMedecinId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Veuillez sélectionner un médecin")),
//       );
//       return;
//     }

//     if (widget.userRole == "secretaire" && _selectedPatientId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Veuillez sélectionner un patient")),
//       );
//       return;
//     }

//     final dateFormatted = DateFormat('yyyy-MM-dd').format(_selectedDate!);
//     final heureFormatted = _selectedTime!.format(context);

//     final Map<String, dynamic> appointmentData = {
//       "date": dateFormatted,
//       "heure": heureFormatted,
//       "medecin": _selectedMedecinId,
//       "description": _descriptionController.text,
//     };

//     if (widget.userRole == "secretaire") {
//       appointmentData["patient"] = _selectedPatientId;
//     }

//     setState(() => _isLoading = true);
//     final success =
//         await ApiMobileRv().priseDeRendezVous(widget.token, appointmentData);
//     setState(() => _isLoading = false);

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Rendez-vous créé avec succès ✅")),
//       );
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Erreur lors de la création du rendez-vous ❌")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Créer un rendez-vous"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               // Date picker
//               TextFormField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   labelText: "Date",
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 onTap: _pickDate,
//                 validator: (_) =>
//                     _selectedDate == null ? "Choisissez une date" : null,
//                 controller: TextEditingController(
//                   text: _selectedDate != null
//                       ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
//                       : '',
//                 ),
//               ),

//               SizedBox(height: 16),

//               // Time picker
//               TextFormField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   labelText: "Heure",
//                   suffixIcon: Icon(Icons.access_time),
//                 ),
//                 onTap: _pickTime,
//                 validator: (_) =>
//                     _selectedTime == null ? "Choisissez une heure" : null,
//                 controller: TextEditingController(
//                   text: _selectedTime != null
//                       ? _selectedTime!.format(context)
//                       : '',
//                 ),
//               ),

//               SizedBox(height: 16),

//               // Dropdown médecin (toujours visible)
//               DropdownButtonFormField<int>(
//                 decoration: InputDecoration(labelText: "Médecin"),
//                 items: medecins.map((med) {
//                   return DropdownMenuItem<int>(
//                     value: med['id'],
//                     child: Text(med['nom'] ?? med['email'] ?? 'Médecin'),
//                   );
//                 }).toList(),
//                 value: _selectedMedecinId,
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedMedecinId = value;
//                   });
//                 },
//                 validator: (value) =>
//                     value == null ? "Veuillez sélectionner un médecin" : null,
//               ),

//               SizedBox(height: 16),

//               // Dropdown patient (uniquement si secrétaire)
//               if (widget.userRole == "secretaire")
//                 DropdownButtonFormField<int>(
//                   decoration: InputDecoration(labelText: "Patient"),
//                   items: patients.map((pat) {
//                     return DropdownMenuItem<int>(
//                       value: pat['id'],
//                       child: Text(pat['nom'] ?? pat['email'] ?? 'Patient'),
//                     );
//                   }).toList(),
//                   value: _selectedPatientId,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedPatientId = value;
//                     });
//                   },
//                   validator: (value) =>
//                       value == null ? "Veuillez sélectionner un patient" : null,
//                 ),

//               SizedBox(height: 16),

//               // Description
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(labelText: "Description"),
//                 maxLines: 3,
//                 validator: (value) => value == null || value.isEmpty
//                     ? "Entrez une description"
//                     : null,
//               ),

//               SizedBox(height: 24),

//               _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : ElevatedButton(
//                       onPressed: _submitForm,
//                       child: Text("Créer le rendez-vous"),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
