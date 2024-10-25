class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition,
      required this.avgTemp});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: json['current']['last_updated'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
