import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-medecins/AjouterUnMedecin.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-medecins/detailsMedecinPourAdmin.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class Medecins {
  final String profile;
  final String nom;
  final String specialisation;
  Medecins(
      {required this.profile, required this.nom, required this.specialisation});
}

class ListeDesMedecinsPourAdmin extends StatefulWidget {
  const ListeDesMedecinsPourAdmin({super.key});

  @override
  State<ListeDesMedecinsPourAdmin> createState() =>
      _ListeDesMedecinsPourAdminState();
}

class _ListeDesMedecinsPourAdminState extends State<ListeDesMedecinsPourAdmin> {
  final List<Medecins> medecins = [
    Medecins(
        profile: "assets/images/med1.jpg",
        nom: "Dr Mankeur wade",
        specialisation: "Cardiologue"),
    Medecins(
        profile: "assets/images/med1.jpg",
        nom: "Dr Medoune Fall",
        specialisation: "Pneumologue"),
    Medecins(
        profile: "assets/images/med1.jpg",
        nom: "Dr Seynabou Faye",
        specialisation: "Cardiologue"),
    Medecins(
        profile: "assets/images/med1.jpg",
        nom: "Dr Amadou Nidaye",
        specialisation: "Dentiste"),
    Medecins(
        profile: "assets/images/med1.jpg",
        nom: "Dr Seynabou Sene",
        specialisation: "Cardiologue"),
    Medecins(
        profile: "assets/images/med1.jpg",
        nom: "Dr Sidy Diop",
        specialisation: "Dentiste"),
    Medecins(
        profile: "assets/images/med1.jpg",
        nom: "Dr Mankeur wade",
        specialisation: "Cardiologue"),
    Medecins(
        profile: "assets/images/med1.jpg",
        nom: "Dr Mankeur Diouf",
        specialisation: "Cardiologue"),
  ];

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
          "listes des \nmedecins",
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
                        hintText: "Recherche un medecin par ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.search,
                      color: Color(0xFFFFFFFF),
                    ),
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(150, 50),
                      backgroundColor: Color(0xFF4CAF50),
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
                    itemCount: medecins.length,
                    itemBuilder: (context, index) {
                      final medecin = medecins[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => detailsMedecinPourAdmin(
                                      medecin: medecin,
                                    )),
                          );
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: ListTile(
                            leading: ClipOval(
                              child: Image.asset(
                                medecin.profile,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(medecin.nom),
                            subtitle: Text(medecin.specialisation),
                          ),
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
                    backgroundColor: Color(0xFF4CAF50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => AjouterUnMedecin()),
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Color(0xFFFFFFFF),
                  ),
                  label: Text(
                    "Ajouter un medecin",
                    style: TextStyle(color: Color(0xFFFFFFFF)),
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
