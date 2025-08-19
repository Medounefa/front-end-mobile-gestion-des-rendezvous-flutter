import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/list-Medecin-Pour-Patient/listMedecinPourPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-rendez-vous-pris-par-des-patient-pour-medecin/listeDesRendezVousPourMedecins.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-patient-pour-secretaire/listePatientPourSecretaire.dart';
import 'package:gestiondesrendezvoushopitals/ui/signUp/signUp.dart';
import 'package:gestiondesrendezvoushopitals/ui/tableau-de-bord/tableauDeBoardMedecin.dart';
import 'package:gestiondesrendezvoushopitals/ui/tableau-de-bord/tableauDeBoardPatient.dart';
import 'package:gestiondesrendezvoushopitals/ui/tableau-de-bord/tableauDeBoardSecretaire.dart';
import 'package:gestiondesrendezvoushopitals/ui/tableau-de-bord/tableauDeBord.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final TextEditingController _nomController = TextEditingController();
  // final TextEditingController _mdpController = TextEditingController();

  final emailController = TextEditingController();
  final mdpController = TextEditingController();

  Future<void> _seConnecter() async {
    try {
      final result =
          await ApiMobileRv.login(emailController.text, mdpController.text);
      print("Données reçues après login : $result");

      if (result != null && result.containsKey('access')) {
        // final role = result['role'];

        final role = (result['role'] ?? '').toString().trim().toLowerCase();

        //add
        final prefs = await SharedPreferences.getInstance();

        //add
        await prefs.setString('jwt_token', result['access']);
        await prefs.setString('role', role);
        // final role = result['role'] ?? 'patient'; // à adapter si nécessaire
        switch (role) {
          case 'admin':
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => tableauDeBord()));
            break;
          case 'secretaire':
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => tableauDeBoardSecretaire()));
            break;
          case 'medecin':
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => tableauDeBoardMedecin()));
            break;
          case 'patient':
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => tableauDeBoardPatient()));
            break;
        }
        // ... redirection selon le rôle
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Échec de connexion")),
        );
      }
    } catch (e) {
      print("Erreur pendant la connexion: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Une erreur est survenue")),
      );
    }
  }

  // void _seConnect() {
  //   String nom = _nomController.text.trim().toLowerCase();
  //   String mdp = _mdpController.text;

  //   if (mdp == "1234") {
  //     switch (nom) {
  //       case 'patient':
  //         Navigator.push((context),
  //             MaterialPageRoute(builder: (context) => tableauDeBoardPatient()));
  //         break;
  //       case 'medecin':
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => tableauDeBoardMedecin()));
  //         break;
  //       case 'secretaire':
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => tableauDeBoardSecretaire(),
  //           ),
  //         );
  //         break;
  //       case 'admin':
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => tableauDeBord(),
  //           ),
  //         );
  //         break;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF007BFF),
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
                                color: Color(0xFF333333),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: emailController,
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
                          controller: mdpController,
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
                                  Color(0xFF4CAF50), // couleur de fond
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
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: _seConnecter),
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
