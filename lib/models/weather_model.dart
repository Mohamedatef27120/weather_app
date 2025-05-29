class Weather {
  final String city;
  final String description;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String icon;
  final String updatedAt;

  Weather({
    required this.city,
    required this.description,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
    required this.updatedAt,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      description: json['weather'][0]['description'],
      temp: json['main']['temp'].toDouble(),
      minTemp: json['main']['temp_min'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      icon: json['weather'][0]['icon'],
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000)
          .toLocal()
          .toString()
          .substring(11, 16),
    );
  }
}
