import '../services/location.dart';
import '../services/networking.dart';

const apiKey = 'd47a22bcc0a7c9c96530f0844d8df567';
const weatherAppMapURL='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkingHelper networkingHelper =
    NetworkingHelper('$weatherAppMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
        var weatherData = await networkingHelper.getData();
        return weatherData;
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
