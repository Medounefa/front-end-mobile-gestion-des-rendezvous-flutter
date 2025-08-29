// import 'package:flutter/material.dart';
// import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
// import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';

// class Createuser extends StatefulWidget {
//   const Createuser({super.key, required Map<String, dynamic> userToEdit});

//   @override
//   State<Createuser> createState() => _CreateuserState();
// }

// class _CreateuserState extends State<Createuser> {
//   final _formKey = GlobalKey<FormState>();
//   String username = '';
//   String prenom = '';
//   String nom = '';
//   String email = '';
//   String password = '';
//   String adresse = '';
//   String numero = '';
//   String specialite = '';
//   String role = 'patient';

//   bool loading = false;

//   void submitUser() async {
//     if (!_formKey.currentState!.validate()) return;
//     _formKey.currentState!.save();

//     setState(() => loading = true);
//     final response = await ApiMobileRv.createUser(
//       username: username,
//       prenom: prenom,
//       nom: nom,
//       email: email,
//       password: password,
//       adresse: adresse,
//       numero: numero,
//       specialite: specialite,
//       role: role,
//     );
//     setState(() => loading = false);

//     if (response != null && response.statusCode == 201) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Utilisateur créé avec succès')),
//       );
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Erreur: ${response?.body}')),
//       );
//     }
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
//           "Ajouter un \nutilisateur",
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
//                   child: Image.asset(
//                     "assets/images/logo.jpg",
//                     width: 40,
//                     height: 40,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Username",
//                   hintText: "username",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onSaved: (value) => username = value!,
//                 validator: (value) => value!.isEmpty ? "Requis" : null,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Prenom",
//                   hintText: "Prenom",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onSaved: (value) => prenom = value!,
//                 validator: (value) => value!.isEmpty ? "Requis" : null,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Nom",
//                   hintText: "Nom",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onSaved: (value) => nom = value!,
//                 validator: (value) => value!.isEmpty ? "Requis" : null,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   hintText: "email",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onSaved: (value) => email = value!,
//                 validator: (value) => value!.isEmpty ? "Requis" : null,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   hintText: "password",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onSaved: (value) => password = value!,
//                 validator: (value) => value!.isEmpty ? "Requis" : null,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Adresse",
//                   hintText: "Adresse",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onSaved: (value) => adresse = value!,
//                 validator: (value) => value!.isEmpty ? "Requis" : null,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Numero",
//                   hintText: "numero",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onSaved: (value) => numero = value!,
//                 validator: (value) => value!.isEmpty ? "Requis" : null,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "specialite",
//                   hintText: "specialite",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onSaved: (value) => specialite = value!,
//                 validator: (value) => value!.isEmpty ? "Requis" : null,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               DropdownButtonFormField(
//                 value: role,
//                 decoration: InputDecoration(
//                   labelText: "Role",
//                   hintText: "role",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 items: [
//                   DropdownMenuItem(value: 'admin', child: Text("Admin")),
//                   DropdownMenuItem(
//                       value: 'secretaire', child: Text("Secrétaire")),
//                   DropdownMenuItem(value: 'medecin', child: Text("Médecin")),
//                   DropdownMenuItem(value: 'patient', child: Text("Patient")),
//                 ],
//                 onChanged: (val) => setState(() => role = val!),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: loading ? null : submitUser,
//                 child: loading
//                     ? CircularProgressIndicator(color: Colors.white)
//                     : Text("Ajouter"),
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

class Createuser extends StatefulWidget {
  final Map<String, dynamic>? userToEdit; // null si création

  const Createuser({super.key, this.userToEdit});

  @override
  State<Createuser> createState() => _CreateuserState();
}

class _CreateuserState extends State<Createuser> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String role = 'patient';

  late TextEditingController usernameController;
  late TextEditingController prenomController;
  late TextEditingController nomController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController adresseController;
  late TextEditingController numeroController;
  late TextEditingController specialiteController;

  @override
  void initState() {
    super.initState();
    // Pré-remplissage des champs si modification
    usernameController = TextEditingController(
        text: widget.userToEdit != null ? widget.userToEdit!['username'] : '');
    prenomController = TextEditingController(
        text: widget.userToEdit != null ? widget.userToEdit!['prenom'] : '');
    nomController = TextEditingController(
        text: widget.userToEdit != null ? widget.userToEdit!['nom'] : '');
    emailController = TextEditingController(
        text: widget.userToEdit != null ? widget.userToEdit!['email'] : '');
    passwordController = TextEditingController(); // vide pour sécurité
    adresseController = TextEditingController(
        text: widget.userToEdit != null ? widget.userToEdit!['adresse'] : '');
    numeroController = TextEditingController(
        text: widget.userToEdit != null ? widget.userToEdit!['numero'] : '');
    specialiteController = TextEditingController(
        text:
            widget.userToEdit != null ? widget.userToEdit!['specialite'] : '');
    role = widget.userToEdit != null ? widget.userToEdit!['role'] : 'patient';
  }

  void submitUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    bool success;
    if (widget.userToEdit != null) {
      // Modification
      success = await ApiMobileRv.updateUser(
        id: widget.userToEdit!['id'],
        username: usernameController.text,
        prenom: prenomController.text,
        nom: nomController.text,
        email: emailController.text,
        password: passwordController.text,
        adresse: adresseController.text,
        numero: numeroController.text,
        specialite: specialiteController.text,
        role: role,
      );
    } else {
      // Création
      final response = await ApiMobileRv.createUser(
        username: usernameController.text,
        prenom: prenomController.text,
        nom: nomController.text,
        email: emailController.text,
        password: passwordController.text,
        adresse: adresseController.text,
        numero: numeroController.text,
        specialite: specialiteController.text,
        role: role,
      );
      success = response != null && response.statusCode == 201;
    }

    setState(() => loading = false);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Opération réussie')),
      );
      Navigator.pop(context, true); // retour à la page précédente
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'opération')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Color(0xFF007BFF),
        title: Text(widget.userToEdit != null
            ? "Modifier l'utilisateur"
            : "Ajouter un utilisateur"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "Username"),
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: prenomController,
                decoration: InputDecoration(labelText: "Prénom"),
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: nomController,
                decoration: InputDecoration(labelText: "Nom"),
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) {
                  if (widget.userToEdit == null && value!.isEmpty) {
                    return "Requis";
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: adresseController,
                decoration: InputDecoration(labelText: "Adresse"),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: numeroController,
                decoration: InputDecoration(labelText: "Numéro"),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: specialiteController,
                decoration: InputDecoration(labelText: "Spécialité"),
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: role,
                decoration: InputDecoration(labelText: "Role"),
                items: [
                  DropdownMenuItem(value: 'admin', child: Text("Admin")),
                  DropdownMenuItem(
                      value: 'secretaire', child: Text("Secrétaire")),
                  DropdownMenuItem(value: 'medecin', child: Text("Médecin")),
                  DropdownMenuItem(value: 'patient', child: Text("Patient")),
                ],
                onChanged: (val) => setState(() => role = val!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: loading ? null : submitUser,
                child: loading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(widget.userToEdit != null ? "Modifier" : "Ajouter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
