//

import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class Ajoutehopitaux extends StatefulWidget {
  @override
  _AjoutehopitauxState createState() => _AjoutehopitauxState();
}

class _AjoutehopitauxState extends State<Ajoutehopitaux> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();

  List<dynamic> _departements = [];
  int? _selectedDepartementId;

  @override
  void initState() {
    super.initState();
    _loadDepartements();
  }

  void _loadDepartements() async {
    final data = await ApiMobileRv.getDepartements();
    setState(() {
      _departements = data;
    });
  }

  void _saveHopital() async {
    if (_selectedDepartementId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Choisir un département")));
      return;
    }
    bool success = await ApiMobileRv.createHopital(
      _nomController.text,
      _adresseController.text,
      _selectedDepartementId!,
    );
    if (success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Hôpital ajouté")));
      _nomController.clear();
      _adresseController.clear();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erreur")));
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: InputDecoration(
                hintText: "Nom de l'hôpital",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _adresseController,
              decoration: InputDecoration(
                hintText: "Adresse",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<int>(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              hint: Text("Sélectionner un département"),
              value: _selectedDepartementId,
              onChanged: (val) {
                setState(() {
                  _selectedDepartementId = val;
                });
              },
              items: _departements.map<DropdownMenuItem<int>>((dep) {
                return DropdownMenuItem<int>(
                  value: dep['id'],
                  child: Text(dep['nom']),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4CAF50),
              ),
              onPressed: _saveHopital,
              icon: Icon(
                Icons.add,
                color: Color(0xFFFFFFFF),
              ),
              label: Text(
                "Ajouter ",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
