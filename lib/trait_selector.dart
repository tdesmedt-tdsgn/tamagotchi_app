import 'package:flutter/material.dart';

typedef OnTraitSelected = void Function(int traitValue);

class TraitSelector extends StatelessWidget {
  final String traitName;
  final OnTraitSelected onTraitSelected;

  const TraitSelector({
    Key? key,
    required this.traitName,
    required this.onTraitSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(traitName),
        Slider(
          value: 50,
          min: 0,
          max: 100,
          divisions: 10,
          onChanged: (value) => onTraitSelected(value.toInt()),
        ),
      ],
    );
  }
}
