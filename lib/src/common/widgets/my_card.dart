import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tsk_4/src/common/constants/app_icons.dart';
import 'package:tsk_4/src/common/utils/context_extension.dart';

class MyCard extends StatelessWidget {
  final List<String> days;
  final List<String> temp;
  final List<String> icons;
  final List<String> speed;
  const MyCard({
    super.key,
    required this.days,
    required this.temp,
    required this.icons,
    required this.speed,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff535353).withValues(alpha: 0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < days.length; i++)
                Column(
                  children: [
                    Text(DateFormat('E d').format(DateTime.parse(days[i]))),
                    SizedBox(height: 20),
                    switch (icons[i]) {
                      "cloudly" => SvgPicture.asset(
                        AppIcons.cloudly,
                        height: 40,
                        width: 40,
                      ),
                      "rainy" => SvgPicture.asset(
                        AppIcons.rainy,
                        height: 40,
                        width: 40,
                      ),
                      "windly" => SvgPicture.asset(
                        AppIcons.windy,
                        height: 40,
                        width: 40,
                      ),
                      "sunny" => SvgPicture.asset(
                        AppIcons.sun,
                        height: 40,
                        width: 40,
                      ),
                      "stormy" => SvgPicture.asset(
                        AppIcons.thunder,
                        height: 40,
                        width: 40,
                      ),
                      "night" => SvgPicture.asset(
                        AppIcons.moon,
                        height: 40,
                        width: 40,
                      ),
                      _ => SvgPicture.asset(
                        AppIcons.cloudly,
                        height: 40,
                        width: 40,
                      ),
                    },
                    SizedBox(height: 20),
                    Text("${temp[i]}°C", style: context.textTheme.bodyMedium),
                    SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      "${speed[i]} \n ${context.localizations.km}",
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
