import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/notifications/notificationPush.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';

class ajoutPatient extends StatefulWidget {
  const ajoutPatient({super.key});

  @override
  State<ajoutPatient> createState() => _ajoutPatientState();
}

class _ajoutPatientState extends State<ajoutPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Ajouter un \npatient"),
        backgroundColor: Color(0xFF0CFAFA),
        toolbarHeight: 100,
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    (context),
                    MaterialPageRoute(builder: (context) => notificationPush()),
                  );
                },
                child: Container(
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
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Container(
            width: 352,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(1, 1))
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nom : ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Entre le nom",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(47, 0, 0, 0),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prenom : ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Entrer le prenom",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(47, 0, 0, 0),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Adresse : ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Entrer l adresse",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(47, 0, 0, 0),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Numero de telephone : ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Entrer le numero de telephone",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(47, 0, 0, 0),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Entrer le mail : ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Entrer le mail",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(47, 0, 0, 0),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "Mot de passe : ",
                  //       style: TextStyle(fontWeight: FontWeight.w600),
                  //     ),
                  //     SizedBox(
                  //       height: 7,
                  //     ),
                  //     TextField(
                  //       decoration: InputDecoration(
                  //           hintText: "Entrer le mot de passe",
                  //           border: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //               color: const Color.fromARGB(47, 0, 0, 0),
                  //             ),
                  //             borderRadius: BorderRadius.circular(5),
                  //           )),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 17,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black.withOpacity(0.1),
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Ajouter"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
