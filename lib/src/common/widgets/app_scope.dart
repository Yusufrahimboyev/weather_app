import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsk_4/src/features/home/bloc/home_bloc.dart';
import 'package:tsk_4/src/features/main/bloc/main_bloc.dart';

import '../dependency/appdependency.dart';

class AppScope extends StatefulWidget {
  final Widget child;
  final AppDependency dependency;

  const AppScope({super.key, required this.child, required this.dependency});

  @override
  State<AppScope> createState() => AppScopeState();
}

class AppScopeState extends State<AppScope> {
  late final AppDependency dependency;
  @override
  initState() {
    super.initState();
    dependency = widget.dependency;
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) =>
            MainBloc(dependency.photoRepository, dependency.sharedPreferences),
      ),
      BlocProvider(
        create: (_) => HomeBloc(
          weatherRepository: dependency.weatherRepository,
          sharedPreferences: dependency.sharedPreferences,
        ),
      ),
    ],
    child: widget.child,
  );
}
