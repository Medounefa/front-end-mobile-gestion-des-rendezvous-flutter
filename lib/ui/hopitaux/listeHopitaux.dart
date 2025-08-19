import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/hopitaux/ajouteHopitaux.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class Hopital {
  final String nom;
  final String adresse;
  final String logo;

  Hopital({required this.nom, required this.adresse, required this.logo});
}

class listeHopitaux extends StatefulWidget {
  const listeHopitaux({super.key});

  @override
  State<listeHopitaux> createState() => _listeHopitauxState();
}

class _listeHopitauxState extends State<listeHopitaux> {
  final List<Hopital> hopitaux = [
    Hopital(
        nom: "Hopital Fann",
        adresse: "Fann Dakar universitaire",
        logo: "assets/images/fannun.png"),
    Hopital(
        nom: "Hopital de Ourrosogui",
        adresse: "Matam OurrosoguiFouta",
        logo: "assets/images/ourro.png"),
    Hopital(
        nom: "Hopital Regional de saint louis",
        adresse: "Saint Louis Pikine",
        logo: "assets/images/stlouis.png"),
    Hopital(
        nom: "Hopital Dalal Jam",
        adresse: "Guediawaye BRT",
        logo: "assets/images/dalaljam.png"),
    Hopital(
        nom: "Hopital de Keur Massar",
        adresse: "Keur Massar Unite 5 Sapeur",
        logo: "assets/images/km.png"),
    Hopital(
        nom: "Hopital Militaire de Ouakam",
        adresse: "1 km rond Point Mermoz",
        logo: "assets/images/ouakam.png"),
    Hopital(
        nom: "Hopital de Diamniadio",
        adresse: "Diamniadio en face Dakar Arene",
        logo: "assets/images/diamniadio.png"),
    Hopital(
        nom: "Hopital Principale",
        adresse: "Dakar Plateau Quatier",
        logo: "assets/images/principal.png"),
    Hopital(
        nom: "Hopital Aristic le Dentec",
        adresse: "Dakar route de Palais",
        logo: "assets/images/dentec.png"),
    Hopital(
        nom: "Hopital Idrissa Pouye de Grand Yoff",
        adresse: "Grand Yoff, Dakar",
        logo: "assets/images/grandyoff.png"),
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
          "liste des hopitaux \ndisponibles",
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: hopitaux.length,
              itemBuilder: (context, index) {
                final hopital = hopitaux[index];
                return ListTile(
                  leading: Image.asset(
                    hopital.logo,
                    width: 100,
                    height: 100,
                  ),
                  title: Text(hopital.nom),
                  subtitle: Text(hopital.adresse),
                  onTap: () {
                    // Action à la sélection
                  },
                );
              },
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
                  MaterialPageRoute(builder: (context) => Ajoutehopitaux()),
                );
              },
              icon: Icon(
                Icons.add,
                color: Color(0xFFFFFFFF),
              ),
              label: Text(
                "Ajouter un hôpital",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
