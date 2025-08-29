import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/medecins-dispo-rv/ListeMedecins.dart';
import 'package:gestiondesrendezvoushopitals/ui/creneaux-disponibles/CreneauxDisponibles.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/prise-de-rendez-vous/MesRendezVousPage.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';
import 'package:intl/intl.dart';

class AjouterRendezVousPourPatient extends StatefulWidget {
  const AjouterRendezVousPourPatient({super.key});

  @override
  State<AjouterRendezVousPourPatient> createState() =>
      _AjouterRendezVousPourPatientState();
}

class _AjouterRendezVousPourPatientState
    extends State<AjouterRendezVousPourPatient> {
  DateTime selectedDate = DateTime.now();

  void _previousDate() {
    setState(() {
      selectedDate = selectedDate.subtract(Duration(days: 1));
    });
  }

  void _nextDate() {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: 1));
    });
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            // content: Text('Rendez-vous pris avec succes'),
            actions: [
              Container(
                padding: EdgeInsets.only(left: 200),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: () {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => MesRendezVousPage()));
                  },
                  child: Text("x"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/right.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Rendez-vous pris avec succes"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE d MMMM yyyy', 'fr_FR').format(selectedDate).toString();
    final List<String> medecins = [
      'Dr Medoune Fall',
      'Dr Mariete Dieng',
      'Dr Fatoumata Sall',
      'Dr Moussa Fall',
    ];

    String selectedMedecin = 'Dr Medoune Fall';

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
          "Ajouter un rv \npour patient",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/images/med1.jpg",
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Medoune Fall",
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 300,
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Medecin : ",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: DropdownButtonFormField<String>(
                              value: selectedMedecin,
                              items: medecins.map((String medecin) {
                                return DropdownMenuItem<String>(
                                  value: medecin,
                                  child: Text(medecin),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMedecin = newValue!;
                                  print(
                                      'Médecin sélectionné : $selectedMedecin');
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Selectionnez une date",
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.chevron_left),
                                onPressed: _previousDate,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  formattedDate,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.chevron_right),
                                onPressed: _nextDate,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Choisissez votre créneau',
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Column(
                            children: [
                              Container(
                                child: CreneauxDisponibles(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Motif de consultation",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 2, 20, 10),
                                child: TextFormField(
                                  maxLines: 3, // or use `null` for unlimited
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF4CAF50),
                                    shadowColor: Colors.transparent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  onPressed: () =>
                                      _showConfirmationDialog(context),
                                  child: Text(
                                    "Confirmer",
                                    style: TextStyle(color: Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
