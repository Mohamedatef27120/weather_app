import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "❌ Failed to load weather data",
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
    );
  }
}
