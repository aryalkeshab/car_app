import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/base_widget.dart';
import 'package:car_app/repository/constants/cached_network_image_builder.dart';
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
  List<Products> favouriteList = [];
  List<bool> _isFavorited = [];

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
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border),
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
                    // child:

                    //   //  Icon(Icons.favorite_border,
                    //   //     color: theme.primaryColor),
                    // )),
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
