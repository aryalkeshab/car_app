import 'package:car_app/view/screens/home_screen.dart';
import 'package:car_app/view/screens/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  final initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: SplashScreen.new,
    ),
    GetPage(
      name: _Paths.home,
      page: HomeScreen.new,
    ),
  ];
}
