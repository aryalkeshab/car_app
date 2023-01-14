import 'package:car_app/repository/constants/app_theme.dart';
import 'package:car_app/repository/constants/constants.dart';
import 'package:car_app/repository/routes/app_pages.dart';
import 'package:car_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      themeMode: ThemeMode.light,
      theme: AppThemes.lightThemeData,
      darkTheme: AppThemes.darkThemeData,
      initialRoute: Routes.home,
      getPages: AppPages.routes,
    );
  }
}
