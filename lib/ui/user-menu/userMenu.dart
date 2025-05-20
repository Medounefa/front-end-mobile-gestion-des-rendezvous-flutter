import 'package:flutter/material.dart';

class UserMenu extends StatefulWidget {
  const UserMenu({super.key});

  @override
  State<UserMenu> createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton<String>(
        offset: const Offset(0, 50),
        tooltip: 'Menu utilisateur',
        icon: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, color: Colors.white),
        ),
        onSelected: (value) {
          if (value == 'settings') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Ouverture des paramètres...')),
            );
          } else if (value == 'logout') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Déconnexion...')),
            );
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem<String>(
            value: 'settings',
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
            ),
          ),
          const PopupMenuItem<String>(
            value: 'logout',
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
            ),
          ),
        ],
      ),
    );
  }
}
