import 'package:flutter/material.dart';
import 'package:weather_application/pages/weather_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async{

    await Future.delayed( const Duration(seconds: 5),(){});
    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context)=>WeatherPages()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 145, 254),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:const [
            Text('Weather App',
            style: TextStyle(
              color:Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),),
            Icon(
            Icons.cloud_circle,
            color: Colors.white,
            size:100,
            semanticLabel: 'Weather app',
          )],
        )
      )
   );
  }
}