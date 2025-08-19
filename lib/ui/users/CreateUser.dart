import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';

class Createuser extends StatefulWidget {
  const Createuser({super.key});

  @override
  State<Createuser> createState() => _CreateuserState();
}

class _CreateuserState extends State<Createuser> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String prenom = '';
  String nom = '';
  String email = '';
  String password = '';
  String adresse = '';
  String numero = '';
  String specialite = '';
  String role = 'patient';

  bool loading = false;

  void submitUser() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => loading = true);
    final response = await ApiMobileRv.createUser(
      username: username,
      prenom: prenom,
      nom: nom,
      email: email,
      password: password,
      adresse: adresse,
      numero: numero,
      specialite: specialite,
      role: role,
    );
    setState(() => loading = false);

    if (response != null && response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Utilisateur créé avec succès')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${response?.body}')),
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
          "Ajouter un \nutilisateur",
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) => username = value!,
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Prenom",
                  hintText: "Prenom",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) => prenom = value!,
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nom",
                  hintText: "Nom",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) => nom = value!,
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) => email = value!,
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) => password = value!,
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Adresse",
                  hintText: "Adresse",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) => adresse = value!,
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Numero",
                  hintText: "numero",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) => numero = value!,
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "specialite",
                  hintText: "specialite",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) => specialite = value!,
                validator: (value) => value!.isEmpty ? "Requis" : null,
              ),
              SizedBox(
                height: 12,
              ),
              DropdownButtonFormField(
                value: role,
                decoration: InputDecoration(
                  labelText: "Role",
                  hintText: "role",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
                    : Text("Ajouter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
