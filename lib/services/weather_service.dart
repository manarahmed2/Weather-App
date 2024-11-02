import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com';
  final String apiKey = 'ced39a1d2951464e928131211241810';
  WeatherService({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/v1/forecast.json?key=$apiKey&q=$cityName&day=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String messageError =
          e.response?.data['error']['messagr'] ?? "opps,there was an error";
      throw Exception(messageError);
    } catch (e) {
      throw Exception('opps,there was an error');
    }
  }
}
