class Weather {
  String? thisCityName; // The name of the city
  double? thisTemp; // The temperature in Celsius
  String? thisWeatherLike; // The general weather condition
  String? thisWeatherDesc; // The description of the weather
  String? thisWeatherIcon; // The icon representing the weather
  double? thisWindSpeed; // The wind speed in meters per second
  int? thisWindDegrees; // The wind direction in degrees
  double? thisWindGust; // The gust speed of the wind
  int? thisHumidity; // The humidity percentage
  double? thisFeelsLike; // The "feels like" temperature in Celsius
  int? thisPressure; // The atmospheric pressure in hPa
  int? thisSeaLevelPressure; // The atmospheric pressure at sea level in hPa
  int? thisGroundLevelPressure; // The atmospheric pressure at ground level in hPa
  String? thisCountryName; // The name of the country

  Weather({
    this.thisCityName,
    required this.thisTemp,
    required this.thisWeatherLike,
    this.thisWeatherDesc,
    this.thisWeatherIcon,
    this.thisWindSpeed,
    this.thisWindDegrees,
    this.thisWindGust,
    this.thisHumidity,
    this.thisFeelsLike,
    this.thisPressure,
    this.thisSeaLevelPressure,
    this.thisGroundLevelPressure,
  });
  // Create a Weather object from a JSON map
  Weather.fromJson(Map<String, dynamic> json) {
    thisCityName = json['name'];
    // Check if the temperature value is null and set it to 0.0 if so
    if (json['main']['temp'] == null) {
      thisTemp = 0.0;
    } else {
      thisTemp = json['main']['temp'] + 0.0;
    }
    thisWeatherLike = json['weather'][0]['main'];
    thisWeatherDesc = json['weather'][0]['description'];
    thisWeatherIcon = json['weather'][0]['icon'];
    thisWindSpeed = json['wind']['speed'] + 0.0;
    // Check if the wind direction value is null and set it to 0 if so
    if (json['wind']['deg'] == null) {
      thisWindDegrees = 0;
    } else {
      thisWindDegrees = json['wind']['deg'];
    }
    // Check if the wind gust value is null and set it to 0.0 if so
    if (json['wind']['gust'] == null) {
      thisWindGust = 0.0;
    } else {
      thisWindGust = json['wind']['gust'] + 0.0;
    }
    thisHumidity = json['main']['humidity'];
    thisFeelsLike = json['main']['feels_like'] + 0.0;
    thisPressure = json['main']['pressure'];
    // Check if the sea level pressure value is null and set it to 0 if so
    if (json['main']['sea_level'] == null) {
      thisSeaLevelPressure = 0;
    } else {
      thisSeaLevelPressure = json['main']['sea_level'];
    }
    // Check if the ground level pressure value is null and set it to 0 if so
    if (json['main']['grnd_level'] == null) {
      thisGroundLevelPressure = 0;
    } else {
      thisGroundLevelPressure = json['main']['grnd_level'];
    }
    thisCountryName = json['sys']['country'];
  }
}
