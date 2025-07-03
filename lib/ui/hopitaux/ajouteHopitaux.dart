import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/hopitaux/listeHopitaux.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';
// import 'package:file_picker/file_picker.dart';

class ajoutHopital extends StatefulWidget {
  const ajoutHopital({super.key});

  @override
  State<ajoutHopital> createState() => _ajoutHopitalState();
}

class _ajoutHopitalState extends State<ajoutHopital> {
  // String? fileName;

  // void pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     PlatformFile file = result.files.first;

  //     setState(() {
  //       fileName = file.name;
  //     });

  //     // Optionnel : afficher le chemin complet ou envoyer le fichier
  //     print("Chemin du fichier : ${file.path}");
  //   }
  // }

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
        title: Text("Ajouter un \nhopital",
            style: TextStyle(color: Color(0xFFFFFFFF))),
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
          Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Container(
                width: 350,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2, 2))
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nom : ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "nom",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Adresse : ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Adresse",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Logo : ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Logo",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4CAF50),
                          ),
                          onPressed: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => listeHopitaux()),
                            );
                          },
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
                    // Column(
                    //   children: [
                    //     Text(
                    //       "Logo : ",
                    //       style: TextStyle(
                    //           fontSize: 17, fontWeight: FontWeight.bold),
                    //     ),
                    //     GestureDetector(
                    //       onTap: pickFile,
                    //       child: AbsorbPointer(
                    //         child: TextFormField(
                    //           readOnly: true,
                    //           controller: TextEditingController(text: fileName),
                    //           decoration: InputDecoration(
                    //             hintText: "nom",
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
