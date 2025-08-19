import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/login/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedRole = 'patient';
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    'prenom': TextEditingController(),
    'nom': TextEditingController(),
    'username': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
    'adresse': TextEditingController(),
    'numero': TextEditingController(),
    'specialite': TextEditingController(),
  };

  // Future<void> _register() async {
  //   final data = {
  //     'prenom': _controllers['prenom']!.text,
  //     'nom': _controllers['nom']!.text,
  //     'username': _controllers['username']!.text,
  //     'email': _controllers['email']!.text,
  //     'password': _controllers['password']!.text,
  //     'adresse': _controllers['adresse']!.text,
  //     'numero': _controllers['numero']!.text,
  //     'specialite': _controllers['specialite']!.text,
  //     'role': _controllers['role']!.text,
  //   };

  //   final response = await ApiMobileRv.register(data);
  //   if (response.statusCode == 201) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Inscription réussie. Connectez-vous.')));
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (_) => Login()));
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Erreur : ${response.body}')));
  //   }
  // }

  // Future<void> _register() async {
  //   try {
  //     final response = await ApiMobileRv.register({
  //       'prenom': _controllers['prenom']?.text ?? '',
  //       'nom': _controllers['nom']?.text ?? '',
  //       'username': _controllers['username']?.text ?? '',
  //       'email': _controllers['email']?.text ?? '',
  //       'password': _controllers['password']?.text ?? '',
  //       'adresse': _controllers['adresse']?.text ?? '',
  //       'numero': _controllers['numero']?.text ?? '',
  //       'specialite': _controllers['specialite']?.text ?? '',
  //       'role': _controllers['role']?.text ?? 'patient',
  //       // ajoute tous les autres champs nécessaires
  //     });

  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Inscription réussie. Redirection...")),
  //       );

  //       // Redirection après succès
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //             builder: (_) => Login()), // remplace par ta vraie page de login
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Erreur d'inscription")),
  //       );
  //     }
  //   } catch (e) {
  //     print("Erreur lors de l'inscription: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Une erreur est survenue")),
  //     );
  //   }
  // }

  Future<void> _register() async {
    final userData = {
      'username': _controllers['username']?.text ?? '',
      'prenom': _controllers['prenom']?.text ?? '',
      'nom': _controllers['nom']?.text ?? '',
      'email': _controllers['email']?.text ?? '',
      'password': _controllers['password']?.text ?? '',
      'adresse': _controllers['adresse']?.text ?? '',
      'numero': _controllers['numero']?.text ?? '',
      'specialite': _controllers['specialite']?.text ?? '',
      'role': selectedRole // ou 'patient'
      // ajoute les autres champs requis
    };

    final result = await ApiMobileRv.register(userData);

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inscription réussie')),
      );

      // 🔁 Redirection vers page de connexion après 1 seconde
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Login()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de l'inscription")),
      );
    }
  }

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
              padding: const EdgeInsets.only(top: 70),
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
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3))
                    ]),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              "Inscrivez-vous",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  spacing: 15,
                                  children: [
                                    ..._controllers.keys.map((field) {
                                      return TextFormField(
                                        controller: _controllers[field],
                                        decoration: InputDecoration(
                                          labelText: field,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ce champ est requis';
                                          }
                                          return null;
                                        },
                                      );
                                    }).toList(),

                                    // Champ Dropdown pour le rôle (en dehors du map)
                                    DropdownButtonFormField<String>(
                                      value: selectedRole,
                                      decoration: InputDecoration(
                                        labelText: 'Rôle',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      items: [
                                        'admin',
                                        'secretaire',
                                        'medecin',
                                        'patient'
                                      ].map((role) {
                                        return DropdownMenuItem<String>(
                                          value: role,
                                          child: Text(role[0].toUpperCase() +
                                              role.substring(1)),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedRole = value!;
                                        });
                                      },
                                      validator: (value) =>
                                          value == null || value.isEmpty
                                              ? 'Veuillez choisir un rôle'
                                              : null,
                                    ),

                                    // ..._controllers.keys.map((field) {
                                    //   return TextFormField(
                                    //     controller: _controllers[field],
                                    //     decoration: InputDecoration(
                                    //       labelText: field,
                                    //       fillColor:
                                    //           Colors.black.withOpacity(0.1),
                                    //       border: OutlineInputBorder(
                                    //         borderRadius:
                                    //             BorderRadius.circular(10),
                                    //       ),
                                    //     ),
                                    //   );
                                    // }).toList(),
                                    SizedBox(height: 25),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(
                                            0xFF4CAF50), // couleur de fond
                                        foregroundColor:
                                            Colors.white, // couleur du texte
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 32, vertical: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: _register,
                                      child: Text("S'inscrire"),
                                    ),
                                  ],
                                ),
                              )),
                        ),

                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       labelText: "Nom",
                        //       hintText: "Entrez votre nom",
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       labelText: "Prenom",
                        //       hintText: "Entrez votre prenom",
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       labelText: "Adresse",
                        //       hintText: "Entrez votre adresse",
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       labelText: "Numero de telephone",
                        //       hintText: "Entrez votre numero de telephone",
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       labelText: "Email",
                        //       hintText: "Creer un email",
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       labelText: "Mot de passe",
                        //       hintText: "Creer mot de passe",
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor:
                        //           Color(0xFF0CFAFA), // couleur de fond
                        //       foregroundColor: Colors.white, // couleur du texte
                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: 32, vertical: 16),
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(12),
                        //       ),
                        //     ),
                        //     onPressed: () {
                        //       // Action du bouton
                        //     },
                        //     child: Text(
                        //       'Se connecter',
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.only(left: 35),
                        //   child: Row(
                        //     children: [
                        //       Container(
                        //         child: Text("Vous avez deja un compte ?"),
                        //       ),
                        //       Container(
                        //         child: ElevatedButton(
                        //           style: ElevatedButton.styleFrom(
                        //             backgroundColor:
                        //                 Colors.transparent, // fond transparent
                        //             shadowColor:
                        //                 Colors.transparent, // pas d'ombre
                        //             elevation: 0, // pas de surélévation
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius:
                        //                   BorderRadius.zero, // bord droit
                        //               side: BorderSide.none, // pas de bordure
                        //             ),
                        //             padding: EdgeInsets
                        //                 .zero, // sans padding si tu veux
                        //           ),
                        //           onPressed: () {
                        //             Navigator.pop(context);
                        //           },
                        //           child: Text(
                        //             "Se connecter",
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
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
