import 'package:flutter/material.dart';

class ListeMedecins extends StatefulWidget {
  const ListeMedecins({super.key});

  @override
  State<ListeMedecins> createState() => _ListeMedecinsState();
}

class _ListeMedecinsState extends State<ListeMedecins> {
  final List<String> medecins = [
    'Médecin 1',
    'Médecin 2',
    'Médecin 3',
    'Médecin 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return medecins.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        print('Médecin sélectionné : $selection');
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: 'Entrez ou choisissez un médecin',
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
