import 'package:flutter/material.dart';
import 'package:gestiondesrendezvoushopitals/ui/disponibiltes-calendrier/listeDisponibilitesCalendrier.dart';
import 'package:gestiondesrendezvoushopitals/ui/menu/Menu.dart';
import 'package:gestiondesrendezvoushopitals/ui/user-menu/userMenu.dart';
import 'package:table_calendar/table_calendar.dart';

class AjouterDisponibiliteCalendrier extends StatefulWidget {
  @override
  _AjouterDisponibiliteCalendrierState createState() =>
      _AjouterDisponibiliteCalendrierState();
}

class _AjouterDisponibiliteCalendrierState
    extends State<AjouterDisponibiliteCalendrier> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<String>> _disponibilites = {};

  List<String> heures = [
    '09:00',
    '10:00',
    '11:00',
    '14:00',
    '15:00',
    '16:00',
  ];

  List<String> _selectedHeures = [];

  // void _ajouterDisponibilite() {
  //   if (_selectedDay != null && _selectedHeures.isNotEmpty) {
  //     final key =
  //         DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day);
  //     setState(() {
  //       _disponibilites[key] = [..._selectedHeures];
  //       _selectedHeures = [];
  //     });
  //   }
  // }

  Widget _buildHeuresCheckboxes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: heures.map((heure) {
        return CheckboxListTile(
          title: Text(heure),
          value: _selectedHeures.contains(heure),
          onChanged: (bool? selected) {
            setState(() {
              if (selected == true) {
                _selectedHeures.add(heure);
              } else {
                _selectedHeures.remove(heure);
              }
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Color(0xFF0CFAFA),
        toolbarHeight: 100,
        title: Text(
          "Ajouter une \nDisponibilite",
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Medecin : ",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Selection le medecins",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
            TableCalendar(
              locale: 'fr_FR',
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedHeures = _disponibilites[selectedDay] ?? [];
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sélectionne les heures pour ${_selectedDay != null ? "${_selectedDay!.day}/${_selectedDay!.month}" : "un jour"}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildHeuresCheckboxes(),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => listeDisponibilitesCalendrier()),
                );
              },
              child: Text('Ajouter la disponibilité'),
            ),
            Divider(height: 30),
            Text(
              'Disponibilités enregistrées :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ..._disponibilites.entries.map((entry) {
              final date = entry.key;
              final heures = entry.value;
              return ListTile(
                title: Text('${date.day}/${date.month}/${date.year}'),
                subtitle: Text('Heures : ${heures.join(", ")}'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
