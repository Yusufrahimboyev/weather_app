import 'package:go_router/go_router.dart';
import 'package:tsk_4/src/features/home/screens/homescreen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    ],
    initialLocation: '/',
    debugLogDiagnostics: true,
    routerNeglect: true,
  );
}
