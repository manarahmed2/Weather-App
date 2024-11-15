import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_wearher_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_wearher_cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 32,
              ))
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        // مسئولة انها ت rebuild ال ui وبتسمع ال cubit
        if (state is WeatherInitialState) {
          return NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody(weatherModel: state.weatherModel);
        } else {
          return Text("ops! there was an error");
        }
      }),
    );
  }
}
