import 'package:clima/key/Secret.dart';
import 'package:clima/key/SecretLoader.dart';

import 'location.dart';
import 'networking.dart';

class WeatherModel {
  Future getCityWeather(String cityName) async {
    Secret secret = await SecretLoader(secretPath: "secrets.json").load();

    var url =
        'https://samples.openweathermap.org/data/2.5/weather?q=$cityName&appid=${secret.apiKey}';
    NetworkHelper helper = NetworkHelper(url);
    return await helper.getData();
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Secret secret = await SecretLoader(secretPath: "secrets.json").load();
    NetworkHelper helper = NetworkHelper(
        'https://samples.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${secret.apiKey}');

    return await helper.getData();
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
