//

import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/users/CreateUser.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';

class ListeSecretaires extends StatefulWidget {
  const ListeSecretaires({super.key});

  @override
  State<ListeSecretaires> createState() => _ListeSecretairesState();
}

class _ListeSecretairesState extends State<ListeSecretaires> {
  List<dynamic> allUsers = [];
  List<dynamic> secretaires = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() => loading = true);
    final users = await ApiMobileRv.getUsers();
    setState(() {
      allUsers = users;
      secretaires = allUsers.where((u) => u['role'] == 'secretaire').toList();
      loading = false;
    });
  }

  Future<void> _deleteSecretaire(int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Confirmer la suppression"),
        content: Text("Voulez-vous vraiment supprimer cette secrétaire ?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("Annuler")),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("Supprimer")),
        ],
      ),
    );

    if (confirm == true) {
      final success = await ApiMobileRv.deleteUser(id);
      if (success) _loadUsers();
    }
  }

  void _editSecretaire(Map<String, dynamic> secretaire) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Createuser(userToEdit: secretaire),
      ),
    );

    if (result == true) _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Color(0xFF007BFF),
        title: Text(
          "Liste des secrétaires",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: secretaires.length,
                      itemBuilder: (context, index) {
                        final secretaire = secretaires[index];
                        return ListTile(
                          title: Text(
                              "${secretaire['prenom']} ${secretaire['nom']}"),
                          subtitle: Text(secretaire['email']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.orange),
                                onPressed: () => _editSecretaire(secretaire),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () =>
                                    _deleteSecretaire(secretaire['id']),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4CAF50),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const Createuser(
                                  userToEdit: {},
                                )),
                      ).then((_) => _loadUsers());
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text(
                      "Ajouter une secrétaire",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
