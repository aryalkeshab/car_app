import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/base_widget.dart';
import 'package:flutter/material.dart';

class CategoryMenu extends StatelessWidget {
  List<Categories> categories;

  CategoryMenu({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, config, theme) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // ListView.builder(
            //     itemCount: categories.length,
            //     itemBuilder: (BuildContext context, index) {
            //       return

            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: config.appVerticalPadding(0.4),
                  horizontal: config.appHorizontalPadding(2),
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  // categories[index].title.toString(),

                  "Hello",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: theme.primaryColor),
                ),
              ),
            ),
            // }),
          ],
        ),
      );
    });
  }
}
