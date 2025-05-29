import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  String _city = 'Alexandria';

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void fetchWeather() async {
    print("📡 Fetching weather for $_city...");
    try {
      final data = await _weatherService.fetchWeather(_city);
      print("✅ Weather fetched: ${data.city}");
      setState(() {
        _weather = data;
      });
    } catch (e, stack) {
      print("❌ Error in fetchWeather: $e");
      print("🔍 Stack trace: $stack");
      setState(() {
        _weather = null;
      });
    }
  }

  void showCityInputDialog(BuildContext context) {
    String selectedCity = _city;

    List<String> cities = [
      'Alexandria',
      'Cairo',
      'London',
      'New York',
      'Tokyo',
      'Paris',
      'Dubai',
      'Berlin',
      'Moscow',
      'Sydney',
      'Riyadh',
      'Istanbul',
      'Rome',
      'Barcelona',
      'Mumbai',
      'Beijing',
    ];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose a City"),
          content: StatefulBuilder(
            builder: (context, setState) {
              return DropdownButton<String>(
                isExpanded: true,
                value: selectedCity,
                items: cities.map((city) {
                  return DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value!;
                  });
                },
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _city = selectedCity;
                  _weather = null;
                });
                fetchWeather();
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Weather App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showCityInputDialog(context);
            },
          ),
        ],
      ),
      body: _weather == null
          ? const NoWeatherBody()
          : WeatherInfoBody(weather: _weather!),
    );
  }
}
