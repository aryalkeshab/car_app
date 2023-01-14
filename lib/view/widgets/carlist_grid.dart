import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/base_widget.dart';
import 'package:car_app/repository/constants/cached_network_image_builder.dart';
import 'package:car_app/view/widgets/text_describe.dart';
import 'package:car_app/viewModel/car_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProductListViewBuilder extends StatefulWidget {
  final List<Products> productList;

  const ProductListViewBuilder({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  State<ProductListViewBuilder> createState() => _ProductListViewBuilderState();
}

class _ProductListViewBuilderState extends State<ProductListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(widget.productList.length, (index) {
          final product = widget.productList[index];
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
                              horizontal: config.appHorizontalPaddingSmall()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Center(
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
                              ),
                              config.verticalSpaceSmall(),
                              NameDescribe(
                                topic: 'Date:',
                                data: product.dateAdded,
                              ),
                              config.verticalSpaceSmall(),
                              NameDescribe(
                                topic: 'Car Price:',
                                data: product.price,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // if (onWishlistButtonClick != null)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        Get.find<CarViewModel>()
                            .products
                            .add(widget.productList[index]);
                      },
                      child: IconButton(
                        icon: product.isFavorited!
                            ? const Icon(
                                Icons.favorite,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                        color: product.isFavorited! ? Colors.red : null,
                        onPressed: () {
                          if (product.isFavorited!) {
                            Get.find<CarViewModel>()
                                .products
                                .remove(widget.productList[index]);
                          } else {
                            Get.find<CarViewModel>()
                                .products
                                .add(widget.productList[index]);
                          }
                          setState(() {
                            product.isFavorited = !product.isFavorited!;
                          });
                        },
                      ),
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
