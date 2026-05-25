import 'package:flutter/material.dart';
import 'package:tsk_4/src/common/widgets/app_scope.dart';
import 'package:tsk_4/src/common/widgets/intialize_app.dart';

import 'src/common/widgets/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dependency = await InitializeApp().initialize();
  runApp(AppScope(dependency: dependency, child: MyApp()));
}
