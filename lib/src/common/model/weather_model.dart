class WeatherModel {
  final double temp;
  final String main;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;
  final DateTime dateTime;
  final double windSpeed;
  final int wmoCode;
  final String cityName;
  final String iconCode;

  WeatherModel({
    required this.dateTime,
    required this.temp,
    required this.main,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
    this.windSpeed = 0,
    this.wmoCode = 0,
    this.cityName = "",
    required this.iconCode,
  });

  factory WeatherModel.fromJson(
    Map<String, dynamic> json, {
    String cityName = "",
  }) {
    final mainData = json['main'] as Map<String, dynamic>? ?? {};
    final windData = json['wind'] as Map<String, dynamic>? ?? {};
    final weatherList = json['weather'] as List<dynamic>? ?? [];
    final weatherInfo = weatherList.isNotEmpty
        ? weatherList[0] as Map<String, dynamic>
        : <String, dynamic>{};

    return WeatherModel(
      dateTime: json['dt_txt'] != null
          ? DateTime.parse(json['dt_txt'] as String)
          : DateTime.now(),
      temp: (mainData['temp'] as num?)?.toDouble() ?? 0,
      main: weatherInfo['main'] as String? ?? '',
      feelsLike: (mainData['feels_like'] as num?)?.toDouble() ?? 0,
      tempMin: (mainData['temp_min'] as num?)?.toDouble() ?? 0,
      tempMax: (mainData['temp_max'] as num?)?.toDouble() ?? 0,
      pressure: mainData['pressure'] as int? ?? 0,
      seaLevel: mainData['sea_level'] as int? ?? 0,
      grndLevel: mainData['grnd_level'] as int? ?? 0,
      humidity: mainData['humidity'] as int? ?? 0,
      tempKf: (mainData['temp_kf'] as num?)?.toDouble() ?? 0,
      windSpeed: (windData['speed'] as num?)?.toDouble() ?? 0,

      // TO'G'RILANDI: API ichidagi 'id' int ko'rinishida olindi
      wmoCode: (weatherInfo['id'] as int?) ?? 0,

      cityName: cityName,

      // TO'G'RILANDI: API ichidagi 'icon' qiymati (masalan: "03d") to'g'ri bog'landi
      iconCode: weatherInfo['icon'] as String? ?? "01d",
    );
  }
}

class WeatherModelList {
  final List<WeatherModel> weatherdata;

  WeatherModelList({required this.weatherdata});

  factory WeatherModelList.fromJson(Map<String, Object?> json) {
    final cityName =
        (json['city'] as Map<String, dynamic>?)?['name'] as String? ?? "";
    final allList = json['list'] as List<dynamic>? ?? [];

    List<dynamic> filteredJsonList = [];

    if (allList.isNotEmpty) {
      final firstElement = allList.first;
      filteredJsonList.add(firstElement);
      final String firstDtTxt = firstElement['dt_txt'] as String? ?? "";
      final String todayDate = firstDtTxt.split(" ").first;

      final remainingDays = allList.where((element) {
        final String dtTxt = element['dt_txt'] as String? ?? "";

        final bool isAtNoon = dtTxt.endsWith("12:00:00");
        final bool isNotToday = !dtTxt.startsWith(todayDate);

        return isAtNoon && isNotToday;
      });
      filteredJsonList.addAll(remainingDays);
    }

    if (filteredJsonList.length > 5) {
      filteredJsonList = filteredJsonList.sublist(0, 5);
    }

    return WeatherModelList(
      weatherdata: filteredJsonList
          .map(
            (e) => WeatherModel.fromJson(
              e as Map<String, dynamic>,
              cityName: cityName,
            ),
          )
          .toList(),
    );
  }
}
