import 'package:car_app/repository/constants/size_config.dart';
import 'package:car_app/repository/constants/ui_assets.dart';
import 'package:car_app/view/widgets/drawer_menu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig(context);
    return Drawer(
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
                Image.asset(
                  UIAssets.appIcon,
                  fit: BoxFit.fill,
                  width: 180,
                ),
                config.horizontalSpaceSmall(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: config.appEdgePadding()),
            child: ListView(
              padding: EdgeInsets.only(top: config.appVerticalPaddingMedium()),
              shrinkWrap: true,
              children: [
                DrawerMenuItem(
                    title: "Profile",
                    icon: Icons.person_outline,
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
    );
  }
}
