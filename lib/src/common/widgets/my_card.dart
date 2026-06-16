import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tsk_4/src/common/model/weather_model.dart';
import 'package:tsk_4/src/common/utils/context_extension.dart';
import 'package:tsk_4/src/common/widgets/icon_changer.dart';

class MyCard extends StatelessWidget {
  final WeatherModelList weatherModelList;

  const MyCard({super.key, required this.weatherModelList});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff535353).withValues(alpha: 0.64),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              for (int i = 0; i < weatherModelList.weatherdata.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat(
                          'E d',
                        ).format(weatherModelList.weatherdata[i].dateTime),
                        style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      IconChanger(
                        iconCode: weatherModelList.weatherdata[i].iconCode,
                        size: 40,
                        wmoCode: weatherModelList.weatherdata[i].wmoCode,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "${weatherModelList.weatherdata[i].temp.round()}°C",
                        style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        textAlign: TextAlign.center,
                        "${weatherModelList.weatherdata[i].windSpeed.round()}\n${context.localizations.km}",
                        style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.white70,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
