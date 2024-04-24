List<WeatherDataModel> weatherDataModelFromJson(data) {
  return List<WeatherDataModel>.from(
    data.map((x) => WeatherDataModel.fromJson(x)),
  );
}

class WeatherDataModel {
  final String city;
  final String icon;
  final String weather;
  final String temperature;

  WeatherDataModel({
    required this.city,
    required this.icon,
    required this.weather,
    required this.temperature,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      city: json["city"],
      icon: json["icon"],
      weather: json["weather"],
      temperature: json["temperature"],
    );
  }
}
