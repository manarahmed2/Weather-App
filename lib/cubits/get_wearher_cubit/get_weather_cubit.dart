import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/cubits/get_wearher_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit()
      : super(WeatherInitialState()); //initialstate>>>>Noweatherstate
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
