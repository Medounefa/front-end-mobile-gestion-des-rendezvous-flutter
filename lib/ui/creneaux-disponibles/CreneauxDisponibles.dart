import 'package:flutter/material.dart';

class CreneauxDisponibles extends StatelessWidget {
  final List<String> creneaux = ['09h00', '11h00', '15h30'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: creneaux.map((creneau) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: OutlinedButton(
            onPressed: () {
              print('Créneau sélectionné : $creneau');
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.transparent,
            ),
            child: Text(
              creneau,
              style: TextStyle(color: const Color.fromARGB(255, 49, 49, 49)),
            ),
          ),
        );
      }).toList(),
    );
  }
}
