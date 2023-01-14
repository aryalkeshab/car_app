import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/apiResponse/product_model.dart';
import 'package:car_app/repository/api_request/search_params.dart';
import 'package:car_app/repository/constants/base_widget.dart';
import 'package:car_app/repository/constants/cached_network_image_builder.dart';
import 'package:car_app/view/widgets/text_describe.dart';
import 'package:car_app/viewModel/car_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  final List<ProductListModel> productList;

  const ProductList({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final carViewModel = Get.find<CarViewModel>();

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: GetBuilder<CarViewModel>(builder: (controlller) {
          List<ProductListModel> productList =
              Get.put(CarViewModel()).allProductList;

          return StaggeredGrid.count(
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
                            Center(
                              child: SizedBox(
                                height: 98,
                                width: 150,
                                child: CustomCachedNetworkImage(
                                  product.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            config.verticalSpaceSmall(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      config.appHorizontalPaddingSmall()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      product.name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                              color: theme.primaryColor),
                                    ),
                                  ),
                                  config.verticalSpaceSmall(),
                                  NameDescribe(
                                    topic: 'Date:',
                                    data: product.dateAdded,
                                  ),
                                  config.verticalSpaceSmall(),
                                  NameDescribe(
                                    topic: 'Car Price:',
                                    data: product.detail,
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
          );
        })
        // }),
        );
  }
}
