import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_wearher_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: TextField(
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              border: OutlineInputBorder(),
              hintText: "search a city",
              labelText: 'search',
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) async {
              var getweathercubit = BlocProvider.of<GetWeatherCubit>(
                  context); //to call cubit to trigger cubit

              getweathercubit.getWeather(cityName: value); //to trigger cubit
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

//WeatherModel? weatherModel; //global object
