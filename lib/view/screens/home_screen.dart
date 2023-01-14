import 'dart:convert';

import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/size_config.dart';
import 'package:car_app/repository/constants/ui_assets.dart';
import 'package:car_app/view/screens/appbar_home.dart';
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
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: config.appEdgePadding(),
                right: config.appEdgePadding(),
                top: config.appHeight(10),
                bottom: config.appHorizontalPaddingLarge(),
              ),
              color: Theme.of(context).primaryColor,
              width: double.maxFinite,
              child: Row(
                children: [
                  Image.asset(UIAssets.appLogo, width: 45),
                  config.horizontalSpaceSmall(),
                  Text("Please login",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: config.appEdgePadding()),
              child: ListView(
                padding:
                    EdgeInsets.only(top: config.appVerticalPaddingMedium()),
                shrinkWrap: true,
                children: [
                  DrawerMenuItem(
                      title: "Profile",
                      icon: Icons.person_outline,
                      onPressed: () {}),
                  config.verticalSpaceLarge(),
                  DrawerMenuItem(
                      title: "Login",
                      icon: Icons.location_on_outlined,
                      onPressed: () {}),
                  config.verticalSpaceLarge(),
                  DrawerMenuItem(
                      title: "About us",
                      icon: CupertinoIcons.info,
                      onPressed: () {}),
                  config.verticalSpaceLarge(),
                  DrawerMenuItem(
                      title: "Privacy Policy",
                      icon: CupertinoIcons.doc_on_doc,
                      onPressed: () {}),
                  config.verticalSpaceLarge(),
                ],
              ),
            )
          ],
        ),
      ),
      body: GetBuilder<CarViewModel>(builder: (controller) {
        final result = carViewModel.response;

        if (result.hasData) {
          List<Categories> categories = result.data;

          return Column(
            children: [
              config.verticalSpaceMedium(),
              CategoryMenu(
                categories: categories,
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
