import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-medecins/AjouterUnMedecin.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-secretaire/AjouterUnSecretaire.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class Secretaires {
  final String profile;
  final String nom;
  final String medecin;
  Secretaires(
      {required this.profile, required this.nom, required this.medecin});
}

class ListeDesSecretaire extends StatefulWidget {
  const ListeDesSecretaire({super.key});

  @override
  State<ListeDesSecretaire> createState() => _ListeDesSecretaireState();
}

class _ListeDesSecretaireState extends State<ListeDesSecretaire> {
  final List<Secretaires> secretaires = [
    Secretaires(
        profile: "assets/images/med1.jpg",
        nom: "Mankeur wade",
        medecin: "Dr Medoune Fall"),
    Secretaires(
        profile: "assets/images/med1.jpg",
        nom: "Amina Sene",
        medecin: "Dr Amadou Faye"),
    Secretaires(
        profile: "assets/images/med1.jpg",
        nom: "Karime",
        medecin: "Dr Malcik Faye"),
    Secretaires(
        profile: "assets/images/med1.jpg",
        nom: "Mamadou Faye",
        medecin: "Dr Marie Elene Mballo"),
    Secretaires(
        profile: "assets/images/med1.jpg",
        nom: "Mimi Toure",
        medecin: "Dr Fatouma Sall Traore"),
    Secretaires(
        profile: "assets/images/med1.jpg",
        nom: "Coumba Faye",
        medecin: "Dr Soukeye Ndiaye"),
    Secretaires(
        profile: "assets/images/med1.jpg",
        nom: "Seynaba Mbaye",
        medecin: "Dr Amadou Pouye"),
    Secretaires(
        profile: "assets/images/med1.jpg",
        nom: "Mankeur wade",
        medecin: "Dr Medoune Fall"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Color(0xFF0CFAFA),
        toolbarHeight: 100,
        title: Text(
          "listes des \nsecretaires",
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
                    ),
                    Positioned(
                      top: 2,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.red,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Recherche un scertaire par ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.search),
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(150, 50),
                      backgroundColor: Color(0xFF0CFAFA),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: secretaires.length,
                    itemBuilder: (context, index) {
                      final secretaire = secretaires[index];
                      return Container(
                        child: ListTile(
                          leading: ClipOval(
                            child: Image.asset(
                              secretaire.profile,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(secretaire.nom),
                          subtitle: Text(secretaire.medecin),
                          onTap: () {
                            // Action à la sélection
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0CFAFA),
                  ),
                  onPressed: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => AjouterUnSecretaire()),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text("Ajouter un secretaire"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
