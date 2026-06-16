import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tsk_4/src/features/countrylist/screens/country_list_screen.dart';
import 'package:tsk_4/src/features/main/screens/main_screen.dart';

class AppRouter {
  AppRouter._();
  static const main = "/";
  static const countrylist = "/countrylist";
  static const search = "/search";
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRouter.main,
  routes: [
    GoRoute(
      path: AppRouter.main,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: AppRouter.countrylist,
      builder: (context, state) => const CountryListScreen(),
    ),
  ],
);
