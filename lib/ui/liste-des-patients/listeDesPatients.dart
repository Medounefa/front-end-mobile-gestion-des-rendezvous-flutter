import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/services/ApiMobileRv.dart';
import 'package:gestiondesrendezvoushopitals/ui/users/CreateUser.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';

class ListeDesPatientsPourAdmin extends StatefulWidget {
  const ListeDesPatientsPourAdmin({super.key});

  @override
  State<ListeDesPatientsPourAdmin> createState() =>
      _ListeDesPatientsPourAdminState();
}

class _ListeDesPatientsPourAdminState extends State<ListeDesPatientsPourAdmin> {
  List<dynamic> patients = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPatients();
  }

  Future<void> _loadPatients() async {
    setState(() => isLoading = true);
    final allUsers =
        await ApiMobileRv.getUsers(); // récupère tous les utilisateurs
    setState(() {
      patients = allUsers.where((u) => u['role'] == 'patient').toList();
      isLoading = false;
    });
  }

  void _deletePatient(int id) async {
    final success = await ApiMobileRv.deleteUser(id);
    if (success) {
      _loadPatients();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Patient supprimé")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur lors de la suppression")));
    }
  }

  void _editPatient(Map<String, dynamic> patient) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Createuser(userToEdit: patient)),
    );
    if (result == true) {
      _loadPatients();
    }
  }

  void _addPatient() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Createuser(userToEdit: null)),
    );
    if (result == true) _loadPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Liste des patients"),
        backgroundColor: Color(0xFF007BFF),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: patients.length,
                    itemBuilder: (context, index) {
                      final patient = patients[index];
                      return ListTile(
                        title: Text("${patient['prenom']} ${patient['nom']}"),
                        subtitle: Text("Email: ${patient['email']}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _editPatient(patient),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deletePatient(patient['id']),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton.icon(
              onPressed: _addPatient,
              icon: Icon(Icons.add),
              label: Text(
                "Ajouter un patient",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4CAF50),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
