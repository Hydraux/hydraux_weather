import 'package:flutter/material.dart';

class CurrentForecastDataCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const CurrentForecastDataCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 50,
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
