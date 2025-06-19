import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/list-Medecin-Pour-Patient/listMedecinPourPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-rendez-vous-pris-par-des-patient-pour-medecin/listeDesRendezVousPourMedecins.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-patient-pour-secretaire/listePatientPourSecretaire.dart';
import 'package:gestiondesrendezvoushopitals/ui/signUp/signUp.dart';
import 'package:gestiondesrendezvoushopitals/ui/tableau-de-bord/tableauDeBord.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();

  void _seConnect() {
    String nom = _nomController.text.trim().toLowerCase();
    String mdp = _mdpController.text;

    if (mdp == "1234") {
      switch (nom) {
        case 'patient':
          Navigator.push(
              (context),
              MaterialPageRoute(
                  builder: (context) => ListmedecinPourPatient()));
          break;
        case 'medecin':
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => listeDesRendezVousPourMedecins()));
          break;
        case 'secretaire':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => listePatientPourSecretaire(),
            ),
          );
          break;
        case 'admin':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => tableauDeBord(),
            ),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF0CFAFA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/logo.jpg",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "Connectez-vous",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _nomController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Entrez votre email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _mdpController,
                          decoration: InputDecoration(
                            labelText: "Mot de passe",
                            hintText: "Entrez votre mot de passe",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0xFF0CFAFA), // couleur de fond
                              foregroundColor: Colors.white, // couleur du texte
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Se connecter',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: _seConnect),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 65),
                        child: Row(
                          children: [
                            Container(
                              child: Text("Pas encore de compte ?"),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.transparent, // fond transparent
                                  shadowColor:
                                      Colors.transparent, // pas d'ombre
                                  elevation: 0, // pas de surélévation
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.zero, // bord droit
                                    side: BorderSide.none, // pas de bordure
                                  ),
                                  padding: EdgeInsets
                                      .zero, // sans padding si tu veux
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Text(
                                  "S'nscrire",
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
