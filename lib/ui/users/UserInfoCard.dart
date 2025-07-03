import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  final String nomUtilisateur;
  final String role; // admin, secrétaire, etc.
  final String? imagePath; // optionnelle

  const UserInfoCard({
    required this.nomUtilisateur,
    required this.role,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final formattedDate = "${date.day}/${date.month}/${date.year}";

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      child: Card(
        color: Color(0xFFF5F5F5),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: imagePath != null
                    ? AssetImage(imagePath!)
                    : AssetImage('assets/images/default_avatar.png'),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bonjour, $nomUtilisateur",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rôle : $role",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    "Aujourd’hui : $formattedDate",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
