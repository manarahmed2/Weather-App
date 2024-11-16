import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_wearher_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_wearher_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  if (['Sunny', 'Clear', 'Partly cloudy'].contains(condition)) {
    return Colors.orange;
  } else if (['Overcast', 'Cloudy', 'Mist', 'Fog'].contains(condition)) {
    return Colors.blue;
  } else if ([
    'Light rain',
    'Moderate rain',
    'Patchy rain possible',
    'Patchy rain nearby',
  ].contains(condition)) {
    return Colors.teal;
  } else if (['Light snow', 'Moderate snow', 'Heavy snow']
      .contains(condition)) {
    return Colors.lightBlue;
  } else if ([
    'Thundery outbreaks possible',
    'Moderate or heavy rain with thunder',
  ].contains(condition)) {
    return Colors.deepPurple;
  } else {
    return Colors.grey; // اللون الافتراضي في حالة عدم تطابق أي حالة
  }
}
