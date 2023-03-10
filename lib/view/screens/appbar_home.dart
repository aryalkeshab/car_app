import 'package:car_app/repository/constants/base_widget.dart';
import 'package:car_app/repository/routes/app_pages.dart';
import 'package:car_app/view/screens/search_screen.dart';
import 'package:car_app/view/screens/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  // final Widget title;
  // final bool showBottomWidget;

  const AppBarHome({
    // this.showBottomWidget = false,
    // required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, config, theme) {
      return AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: config.appHorizontalPaddingMedium()),
          child: Builder(builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(CupertinoIcons.line_horizontal_3_decrease),
            );
          }),
        ),
        leadingWidth: 30,
        centerTitle: true,
        title: const Text("Car Collection"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Get.toNamed(Routes.wishlist);
            },
          ),
        ],
        bottom: SearchBarContainer(
          onPressed: () {
            Get.toNamed(Routes.search);
          },
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}

class SearchBarContainer extends StatelessWidget
    implements PreferredSizeWidget {
  final Color? fillColor;
  final VoidCallback onPressed;

  const SearchBarContainer({
    Key? key,
    this.fillColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: BaseWidget(builder: (context, config, theme) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: config.appEdgePadding(),
              vertical: config.appVerticalPaddingSmall()),
          padding: EdgeInsets.only(left: config.appHorizontalPaddingMedium()),
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: fillColor ?? const Color(0xfff2f2f2),
          ),
          child: Row(
            children: [
              Icon(CupertinoIcons.search, size: 15),
              config.horizontalSpaceSmall(),
              Text(
                'You are looking for...',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: const Color(0xffABA8A8)),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
