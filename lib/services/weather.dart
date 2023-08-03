import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const API_KEY = 'e5fe2584b14ca6ddf90f1ed74dab41f2';
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$API_KEY&units=metric';
    NetworkHelper nh = NetworkHelper(url);
    var weatherData = await nh.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    var latitude = loc.Latitude;
    var longitude = loc.Longitude;

    NetworkHelper nh = NetworkHelper(
        "$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$API_KEY&units=metric");

    var decodedData = await nh.getData();
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
