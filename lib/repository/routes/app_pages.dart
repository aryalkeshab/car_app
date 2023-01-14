import 'package:car_app/view/screens/home_screen.dart';
import 'package:car_app/view/screens/search_screen.dart';
import 'package:car_app/view/screens/splash_screen.dart';
import 'package:car_app/view/screens/wishlist_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  final initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: SplashScreen.new,
    ),
    GetPage(
      name: _Paths.home,
      page: HomeScreen.new,
    ),
    GetPage(
      name: _Paths.search,
      page: SearchScreen.new,
    ),
    GetPage(
      name: _Paths.wishlist,
      page: WishListScreen.new,
    ),
  ];
}
