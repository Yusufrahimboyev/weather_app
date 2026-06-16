import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsk_4/src/features/home/bloc/home_bloc.dart';
import 'package:tsk_4/src/features/home/screens/homescreen.dart';
import 'package:tsk_4/src/features/main/bloc/main_bloc.dart';
import 'package:tsk_4/src/features/main/bloc/main_event.dart';
import 'package:tsk_4/src/features/main/bloc/main_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    final cities = context.read<HomeBloc>().state.cities;
    final city = cities.isNotEmpty ? cities.first : 'Tashkent';
    context.read<MainBloc>().add(GetPhoto$MainEvent(city: city));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BlocBuilder<MainBloc, MainState>(
            buildWhen: (previous, current) => previous.photo != current.photo,
            builder: (context, state) {
              if (state.photo.isEmpty) {
                return Container(color: Colors.blueGrey.shade900);
              }
              return CachedNetworkImage(
                imageUrl: state.photo,
                placeholder: (context, url) =>
                    Container(color: Colors.blueGrey.shade900),
                errorWidget: (context, url, error) =>
                    Container(color: Colors.blueGrey.shade900),
                fit: BoxFit.cover,
                color: Colors.grey.withValues(alpha: 0.3),
                colorBlendMode: BlendMode.darken,
              );
            },
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
            child: Container(color: Colors.black.withValues(alpha: 0.3)),
          ),
        ),
        HomeScreen(),
      ],
    );
  }
}
