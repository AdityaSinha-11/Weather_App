import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class Weatherhomepage extends StatefulWidget {
  const Weatherhomepage({Key? key}) : super(key: key);

  @override
  State<Weatherhomepage> createState() => _WeatherhomepageState();
}

class _WeatherhomepageState extends State<Weatherhomepage> {
  final _weatherService = WeatherService('82619b79fff75450ab8ca498ae838114');
  Weather? _weather;

  // Fetch weather
  Future<void> _fetchWeather() async {
    try {
      // Get the current city
      String cityName = await _weatherService.getCurrentCity();

      // Get weather for city
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print("Error fetching weather: $e");
    }
  }

    //get weather animations

    String getWeatherAnimations(String? mainCondition){
      if(mainCondition == null) return 'assets/sunny.json'; //default

      switch(mainCondition.toLowerCase()){
        case 'clouds': return 'assets/cloudy.json';
        case 'mist': return 'assets/cloudy.json';
        case 'smoke': return 'assets/cloudy.json';
        case 'haze': return 'assets/cloudy.json';
        case 'dust': return 'assets/cloudy.json';
        case 'fog': return 'assets/cloudy.json';
        case 'rain': return 'assets/rainy.json';
        case 'drizzel': return 'assets/rainy.json';
        case 'shower rain': return 'assets/rainy.json';
        case 'thunderstrom': return 'assets/thunder.json';
        case 'clear': return 'assets/sunny.json';
        default : return 'assets/sunny.json';

      }

    }

  // Init state
  @override
  void initState() {
    super.initState();
    // Fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // City name
            Text(
              _weather?.cityName.toUpperCase() ?? "Loading city...",
              style: TextStyle(fontSize: 26, ), 
            ),
            SizedBox(height: 10),
            
            //animation
              Lottie.asset(getWeatherAnimations(_weather?.mainCondition)),

            // Temperature
            Text(
              _weather != null
                  ? '${_weather!.temperature.round()}°C'
                  : 'Loading temperature...',
              style: TextStyle(fontSize: 48),),

              //weather condition

              Text(_weather?.mainCondition ?? "" , style: TextStyle(fontSize: 26) ,) 
          ],
        ),
      ),
    );
  }
}
