import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/base_widget.dart';
import 'package:car_app/view/widgets/carlist_grid.dart';
import 'package:car_app/view/widgets/text_describe.dart';
import 'package:flutter/material.dart';

class CategoryMenu extends StatefulWidget {
  List<Categories> categories;

  CategoryMenu({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  int categoriesIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BaseWidget(builder: (context, config, theme) {
        return Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(widget.categories.length, (index) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            categoriesIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: config.appVerticalPadding(1),
                            horizontal: config.appHorizontalPadding(4),
                          ),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            widget.categories[index].title.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    color: theme.primaryColor, fontSize: 17),
                          ),
                        ),
                      ),
                      config.horizontalSpaceSmall(),
                    ],
                  );
                }),
              ),
            ),
            config.verticalSpaceMedium(),
            Row(
              children: [
                const Text(
                  "Category: ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.categories[categoriesIndex].title}",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                      fontSize: 17),
                )
              ],
            ),
            config.verticalSpaceMedium(),
            Builder(
              builder: (context) {
                List<Products> products =
                    widget.categories[categoriesIndex].products!;

                return ProductListViewBuilder(productList: products);
              },
            ),
          ],
        );
      }),
    );
  }
}
