import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio _dio = Dio();

  final String apiKey = '888687ef7a54edb3ecefe39990ae202b';

  Future<Weather> fetchWeather(String cityName) async {
    const String url = 'https://api.openweathermap.org/data/2.5/weather';
    print("🌐 Requesting weather for: $cityName");
    try {
      final response = await _dio.get(url, queryParameters: {
        'q': cityName,
        'appid': apiKey,
        'units': 'metric',
      });

      print("✅ API response: ${response.data}");
      return Weather.fromJson(response.data);
    } catch (e) {
      print('❌ API Error: $e');
      rethrow;
    }
  }

}
