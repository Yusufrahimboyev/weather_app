import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tsk_4/src/common/style/app_icons.dart';
import 'package:tsk_4/src/common/utils/context_extension.dart';
import 'package:tsk_4/src/common/widgets/my_card.dart';
import 'package:tsk_4/src/features/home/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.white),
            ),
          ),
        ],
        leading: PopupMenuButton(
          icon: Icon(Icons.location_on_sharp, color: Colors.white),
          itemBuilder: (context) => [
            PopupMenuItem(child: Text("Tashkent"), onTap: () => {}),
            PopupMenuItem(
              child: Text(context.localizations.AddNewCity),
              onTap: () => {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(context.localizations.AddNewCity),
                      content: TextField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          labelText: context.localizations.CityName,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            context.localizations.Cancel,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        TextButton(
                          onPressed: () => {
                            context.read<HomeBloc>().add(
                              GetWeather$HomeEvent(city: _cityController.text),
                            ),
                            Navigator.pop(context),
                          },
                          child: Text(context.localizations.Add),
                        ),
                      ],
                    );
                  },
                ),
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('MMMM d').format(DateTime.now()),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "${context.localizations.update} ${DateFormat('d/M/yyyy h:mm a').format(DateTime.now())}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                SvgPicture.asset(AppIcons.cloudly, height: 96, width: 96),
                Text("16ºC", style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.humidity,
                      height: 40,
                      width: 40,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(context.localizations.Humidity),
                    SizedBox(height: 10),
                    Text("60%"),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.windy,
                      height: 40,
                      width: 40,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(context.localizations.wind),
                    SizedBox(height: 10),
                    Text("10 km/h"),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.temperature,
                      height: 40,
                      width: 40,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(context.localizations.feel),
                    SizedBox(height: 10),
                    Text("16ºC"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              context.localizations.FiveDayWeather,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            MyCard(
              days: [
                "2026-05-09",
                "2026-05-10",
                "2026-05-11",
                "2026-05-12",
                "2026-05-13",
              ],
              temp: ["16", "17", "18", "19", "20"],
              icons: ["cloudly", "rainy", "windly", "sunny", "stormy"],
              speed: ["10", "17", "18", "19", "20"],
            ),
          ],
        ),
      ),
    );
  }
}
