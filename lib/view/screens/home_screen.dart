import 'dart:convert';

import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/base_widget.dart';
import 'package:car_app/repository/constants/size_config.dart';
import 'package:car_app/repository/constants/ui_assets.dart';
import 'package:car_app/view/screens/appbar_home.dart';
import 'package:car_app/view/screens/drawer.dart';
import 'package:car_app/view/widgets/carlist_grid.dart';
import 'package:car_app/view/widgets/category.dart';
import 'package:car_app/view/widgets/drawer_menu_items.dart';
import 'package:car_app/viewModel/car_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.put(CarViewModel()).fetchCarData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final carViewModel = Get.find<CarViewModel>();
    final config = SizeConfig(context);

    return Scaffold(
      appBar: const AppBarHome(),
      drawer: DrawerBar(),
      body: GetBuilder<CarViewModel>(builder: (controller) {
        final result = carViewModel.response;
        if (result.hasData) {
          List<Categories> categories = result.data;
          return BaseWidget(builder: (context, config, theme) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: config.appHorizontalPaddingMedium()),
              child: Column(
                children: [
                  Column(
                    children: [
                      config.verticalSpaceMedium(),
                      CategoryMenu(
                        categories: categories,
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
