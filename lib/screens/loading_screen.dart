import 'package:clima/screens/location_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  late double latitude;
  late double longitude;

  void getLocationData() async {
    var decodedData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: decodedData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
        body: Center(
      child: SpinKitWave(
        color: Colors.white,
        size: 50,
      ),
    ));
  }
}
