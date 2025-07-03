import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/rapports-admin/ajouterUnRapport.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class rapportsAdmin extends StatefulWidget {
  const rapportsAdmin({super.key});

  @override
  State<rapportsAdmin> createState() => _rapportsAdminState();
}

class _rapportsAdminState extends State<rapportsAdmin> {
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
          "Rapports",
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
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Parients : ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("12/01/2025 a 12/05/2025"),
                    Text("Nombre de patient consultes"),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(20),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Medecins : ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("12/01/2025 a 12/05/2025"),
                    Text("Nombre de patient consultes"),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(20),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Departement : ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("12/01/2025 a 12/05/2025"),
                    Text("Nombre de patient consultes"),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(20),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hopital: ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("12/01/2025 a 12/05/2025"),
                    Text("Nombre de patient consultes"),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rendez-vous : ",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("12/01/2025 a 12/05/2025"),
                    Text("Total des rendz-vous"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black.withOpacity(0.2),
                      backgroundColor: Color(0xFF4CAF50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => ajouterUnRapport()),
                    );
                  },
                  child: Text(
                    "Ajouter un rapport",
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
