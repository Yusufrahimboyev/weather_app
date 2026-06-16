import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:tsk_4/src/common/router/app_router.dart';
import 'package:tsk_4/src/common/utils/context_extension.dart';
import 'package:tsk_4/src/common/widgets/my_card.dart';
import 'package:tsk_4/src/features/home/bloc/home_bloc.dart';
import 'package:tsk_4/src/features/home/screens/current_weather.dart';
import 'package:tsk_4/src/features/main/bloc/main_bloc.dart';
import 'package:tsk_4/src/features/main/bloc/main_event.dart';

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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox.shrink(),
        centerTitle: false,
        titleSpacing: 0,
        title: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return PopupMenuButton(
              offset: const Offset(0, 40),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on_sharp, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    state.weatherdata.isNotEmpty
                        ? state.weatherdata.first.cityName
                        : "Tashkent",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
              itemBuilder: (context) => [
                for (String city
                    in state.weatherdata.map((e) => e.cityName).toList()) ...[
                  PopupMenuItem(
                    value: city,
                    child: Text(city),
                    onTap: () {
                      context.read<HomeBloc>().add(
                        GetWeatherList$HomeEvent(city),
                      );
                      context.read<MainBloc>().add(
                        GetPhoto$MainEvent(city: city),
                      );
                    },
                  ),
                ],
              ],
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => context.push(AppRouter.countrylist),
              icon: const Icon(Icons.list, color: Colors.white),
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status.isLoading && state.weatherdata.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.weatherdata.isEmpty) {
            return Center(
              child: Text(context.localizations.SearchForCity),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: ListView(
              children: [
                SizedBox(height: 30),
                CurrentWeather(
                  currentWeather: state.weatherModelList.weatherdata.first,
                ),
                MyCard(weatherModelList: state.weatherModelList),
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
