import 'package:flutter/material.dart';

class HomeCityCards extends StatelessWidget {
  const HomeCityCards({
    super.key,
    required this.city,
    required this.weather,
    required this.isSelected,
    required this.temperature,
  });

  final String city;
  final String weather;
  final bool isSelected;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.teal : Colors.white,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: isSelected
                ? Colors.teal.withOpacity(0.2)
                : Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 35),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(city, style: const TextStyle(fontSize: 20)),
                  Text("$temperature°C - $weather"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
