import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterestChips extends StatefulWidget {
  const InterestChips({super.key});

  @override
  State<InterestChips> createState() => _InterestChipsState();
}

class _InterestChipsState extends State<InterestChips> {
  final List<String> interests = [
    'Minimalist', 'Avant-Garde', 'Streetwear',
    'Cyberpunk', 'Vintage', 'Sustainable'
  ];

  final Set<String> selected = {'Avant-Garde'};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: interests.map((e) {
        final isSelected = selected.contains(e);

        return ChoiceChip(
          label: Text(e),
          selected: isSelected,
          onSelected: (val) {
            setState(() {
              val ? selected.add(e) : selected.remove(e);
            });
          },
        );
      }).toList(),
    );
  }
}