import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/creneaux-disponibles/CreneauxDisponibles.dart';
import 'package:gestiondesrendezvoushopitals/ui/list-Medecin-Pour-Patient/listMedecinPourPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/prise-de-rendez-vous/HistoriqueRendezVousPourPatients.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';
import 'package:intl/intl.dart';

class PriseDeRendezVous extends StatefulWidget {
  const PriseDeRendezVous({super.key});

  @override
  State<PriseDeRendezVous> createState() => _PriseDeRendezVousState();
}

class _PriseDeRendezVousState extends State<PriseDeRendezVous> {
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
              // Text("Rendez-vous pris avec succes"),
              // TextButton(
              //   child: Text('Annuler'),
              //   onPressed: () {
              //     Navigator.of(context).pop(); // Fermer le popup
              //   },
              // ),
              // TextButton(
              //   child: Text('Oui'),
              //   onPressed: () {
              //     Navigator.of(context).pop(); // Fermer
              //     // 👉 Action à exécuter
              //     print('Action confirmée');
              //   },
              // ),
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
                            builder: (context) =>
                                HistoriqueRendezVousPourPatients()));
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

    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF), // icône burger noir
        ),
        backgroundColor: Color(0xFF007BFF),
        toolbarHeight: 100,
        title: Text(
          "Prendre un \nrendez-vous \navec le medecin",
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
                  child: UserMenu(),
                ),
              ),
            ],
          ),
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
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Dr Medoune Fall",
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF212121),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Specialte : ",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF212121),
                                fontSize: 17),
                          ),
                          Text(
                            "Cardiologue",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.place),
                          Text(
                            "Hopital Fann",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF212121),
                                fontSize: 20),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
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
                                  color: Color(0xFF212121),
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
                                color: Color(0xFF212121),
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
                                    color: Color(0xFF212121),
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
