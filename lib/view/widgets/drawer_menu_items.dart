import 'package:car_app/repository/constants/base_widget.dart';
import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final String title;

  final VoidCallback onPressed;

  /// Icon for home drawer menu item
  ///
  /// [icon] can be String or IconData
  final dynamic icon;

  const DrawerMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  })  : assert(icon is String || icon is IconData),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, config, theme) {
      return InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                if (icon is String) {
                  return Image.asset(
                    icon,
                    width: 25,
                  );
                } else {
                  return Icon(icon);
                }
              },
            ),
            config.horizontalSpaceMedium(),
            Text(title),
          ],
        ),
      );
    });
  }
}
