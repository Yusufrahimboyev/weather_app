import 'package:flutter/material.dart';
import 'package:tsk_4/src/common/dependency/appdependency.dart';
import 'package:tsk_4/src/common/l10n/generated/l10n.dart';
import 'package:tsk_4/src/common/widgets/app_scope.dart';

extension ContextExtension on BuildContext {
  AppDependency get dependencies =>
      findAncestorStateOfType<AppScopeState>()!.dependency;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  S get localizations => S.of(this);
  AppDependency get dependency =>
      findAncestorStateOfType<AppScopeState>()!.dependency;
}
