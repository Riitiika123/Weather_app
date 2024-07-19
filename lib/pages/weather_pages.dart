import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application/models/weather_models.dart';
import 'package:weather_application/services/weather_services.dart';

class WeatherPages extends StatefulWidget {
  const WeatherPages({super.key});

  @override
  State<WeatherPages> createState() => _WeatherPagesState();
}

class _WeatherPagesState extends State<WeatherPages> {
  //api key
  final _WeatherService = WeatherService('fce39ff7d82a732e78258d177c30b0ca');

  //var to store information for waether , we get from Open_weather API
  Weather ?_weather;

  //fetch weather 
_fetchWeather() async{
  //get the current city 

String cityName = await _WeatherService.getCurrentCity();

  //get weather for city 
  try {
    final weather =await _WeatherService.getWeather(cityName);
    setState(() {
      _weather = weather;
    });
  }
//any errors 
catch(e){
  print(e);
}


}

// weather animations 

String getWeatherAnimation(String?mainCondition){
  if (mainCondition == null) return 'assets/sunny.json';
  switch(mainCondition.toLowerCase()){
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
    return 'assets/cloudy.json';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
       return 'assets/rainy.json';
    case 'thunderstorm':
    return 'assets/storm.json';
    case  'clear':
     return 'assets/sunny.json';
    default :
    return 'assets/rainy.json';

  }
}


//init state 
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    //fetch the waether on startup

_fetchWeather();
  }
  
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 182, 182),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
          //cityname
          Text(_weather?.cityName??"loading city.."),

          SizedBox(height: 20,),

        
         //animation 
         Lottie.asset(getWeatherAnimation(_weather?.mainCondition??"")),

          //temperature
          Text('${_weather?.temperature.round()}°C'),

          //weather condition
          Text(_weather?.mainCondition??""),

          
        ],),
      ),

     
    );
    
  }
}
