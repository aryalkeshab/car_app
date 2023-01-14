import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/base_widget.dart';
import 'package:car_app/repository/constants/cached_network_image_builder.dart';
import 'package:car_app/view/widgets/text_describe.dart';
import 'package:car_app/viewModel/car_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistCard extends StatelessWidget {
  final Products favouriteListProduct;

  const WishlistCard({
    Key? key,
    required this.favouriteListProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarViewModel>(builder: (controller) {
      return BaseWidget(builder: (context, config, themeData) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(config.appEdgePadding()),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 100,
                  child:
                      CustomCachedNetworkImage("${favouriteListProduct.image}"),
                ),
                config.horizontalSpaceMedium(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          favouriteListProduct.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                      ),
                      config.verticalSpaceSmall(),
                      NameDescribe(
                        topic: 'Released Date:',
                        data: favouriteListProduct.dateAdded,
                      ),
                      config.verticalSpaceSmall(),
                      NameDescribe(
                        topic: 'Car Price:',
                        data: favouriteListProduct.price,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
    });
  }
}
