import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  final Weather weather;

  const WeatherInfoBody({super.key, required this.weather});

  String getWeatherAsset(String description) {
    description = description.toLowerCase();
    if (description.contains('cloud')) return 'assets/images/cloudy.png';
    if (description.contains('rain')) return 'assets/images/rainy.png';
    if (description.contains('clear')) return 'assets/images/clear.png';
    if (description.contains('snow')) return 'assets/images/snow.png';
    if (description.contains('thunder')) return 'assets/images/thunderstorm.png';
    return 'assets/images/cloudy.png'; // default
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.city,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            "updated at : ${weather.updatedAt}",
            style: const TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Image.asset(
            getWeatherAsset(weather.description),
            height: 100,
          ),
          const SizedBox(height: 10),
          Text(
            "${weather.temp.round()}",
            style: const TextStyle(fontSize: 60, color: Colors.black),
          ),
          Text(
            "maxTemp: ${weather.maxTemp.round()}   minTemp: ${weather.minTemp.round()}",
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            weather.description,
            style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
