import 'package:appraisal_project/appraisal/screens/dashboard.dart';
import 'package:appraisal_project/core/hive_services.dart';
import 'package:appraisal_project/login/screens/login.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        name: 'login',
        path: '/',
        builder: (context, state) {
          // return LoginScreen();
          return HiveService.getLogin() != null &&
                  HiveService.getLogin() == true
              ? Dashboard()
              : LoginScreen();
        }),
    GoRoute(
      name: 'dashboard',
      path: '/dashboard',
      builder: (context, state) => const Dashboard(),
    ),
  ],
);
