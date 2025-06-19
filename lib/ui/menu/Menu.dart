import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/departements.dart/departementsDispo.dart';
import 'package:gestiondesrendezvoushopitals/ui/disponibiltes-calendrier/AjouterDisponibiliteCalendrier.dart';
import 'package:gestiondesrendezvoushopitals/ui/disponibiltes-calendrier/listeDisponibilitesCalendrier.dart';
import 'package:gestiondesrendezvoushopitals/ui/hopitaux/listeHopitaux.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-medecins/ListeDesMedecinsPourAdmin.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-patients/listeDesPatients.dart';
import 'package:gestiondesrendezvoushopitals/ui/liste-des-secretaire/listeDesSecretaire.dart';
import 'package:gestiondesrendezvoushopitals/ui/rapports-admin/ajouterUnRapport.dart';
import 'package:gestiondesrendezvoushopitals/ui/rapports-admin/rapportsAdmin.dart';
import 'package:gestiondesrendezvoushopitals/ui/rendez-vous/ajouterUnRendezVousPourPatientParAdmin.dart';
import 'package:gestiondesrendezvoushopitals/ui/rendez-vous/listeDesRendezVousDisponiblePourAdmin.dart';

import 'package:gestiondesrendezvoushopitals/ui/tableau-de-bord/tableauDeBord.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
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
                    Container(
                      child: Text("Adiministrateur"),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Tableau de bord"),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(builder: (context) => tableauDeBord()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text("Hopitaux"),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(builder: (context) => listeHopitaux()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_fire_department_sharp),
              title: Text("Departement"),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(builder: (context) => departementsDispo()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.vaccines),
              title: Text("Medecins"),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => ListeDesMedecinsPourAdmin()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("Secretaire"),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => ListeDesSecretaire(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text("Patients"),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => listeDesPatients(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Rendez-vous"),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) =>
                          listeDesRendezVousDisponiblePourAdmin()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("Calendrier / disponibilites"),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => listeDisponibilitesCalendrier()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text("Rapports"),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(builder: (context) => rapportsAdmin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class Menu extends StatelessWidget {
//   final String role;
//   const Menu({required this.role, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.all(10),
//         children: [
//           DrawerHeader(
//             child: Column(
//               children: [
//                 ClipOval(
//                   child: Image.asset(
//                     "assets/images/med1.jpg",
//                     width: 100,
//                     height: 100,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Text(role.toUpperCase()),
//               ],
//             ),
//           ),
//           if (role == 'admin') ...[
//             _buildTile(
//                 context, Icons.dashboard, 'Tableau de bord', '/tableauDeBord'),
//             _buildTile(context, Icons.local_hospital, 'Hôpitaux', '/hopitaux'),
//             _buildTile(context, Icons.local_fire_department, 'Départements',
//                 '/departements'),
//             _buildTile(context, Icons.vaccines, 'Médecins', '/medecins'),
//             _buildTile(
//                 context, Icons.person_outline, 'Secrétaires', '/secretaires'),
//             _buildTile(context, Icons.group, 'Patients', '/patients'),
//             _buildTile(context, Icons.assignment, 'Rendez-vous', '/rendezvous'),
//             _buildTile(
//                 context, Icons.calendar_today, 'Calendrier', '/disponibilites'),
//             _buildTile(context, Icons.note, 'Rapports', '/rapports'),
//           ] else if (role == 'secretaire') ...[
//             _buildTile(
//                 context, Icons.group, 'Liste Patients', '/patientsSecretaire'),
//           ] else if (role == 'medecin') ...[
//             _buildTile(context, Icons.calendar_today, 'Rendez-vous pris',
//                 '/rendezvousMedecin'),
//           ] else if (role == 'patient') ...[
//             _buildTile(context, Icons.local_hospital, 'Liste Médecins',
//                 '/medecinsPourPatient'),
//           ]
//         ],
//       ),
//     );
//   }

//   ListTile _buildTile(
//       BuildContext context, IconData icon, String title, String routeName) {
//     return ListTile(
//       leading: Icon(icon),
//       title: Text(title),
//       onTap: () => Navigator.pushNamed(context, routeName),
//     );
//   }
// }
