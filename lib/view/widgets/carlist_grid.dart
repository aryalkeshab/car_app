import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/base_widget.dart';
import 'package:car_app/repository/constants/cached_network_image_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductListViewBuilder extends StatelessWidget {
  final List<Products> productList;

  const ProductListViewBuilder({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(productList.length, (index) {
          final product = productList[index];
          return BaseWidget(builder: (context, config, theme) {
            return Container(
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 98,
                          child: CustomCachedNetworkImage(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        config.verticalSpaceSmall(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: config.appHorizontalPaddingSmall()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // product.name.toString(),

                                ":hello", maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              config.verticalSpaceVerySmall(),
                              Text(
                                product.detail.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        }),
      ),
    );
  }
}
