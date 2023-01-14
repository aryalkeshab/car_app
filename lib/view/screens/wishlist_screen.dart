import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/base_widget.dart';
import 'package:car_app/view/widgets/favourite_card.dart';
import 'package:car_app/viewModel/car_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    List<Products> products = Get.put(CarViewModel()).products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, config, themeData) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Wishlist'),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: config.appEdgePadding()),
            child: GetBuilder<CarViewModel>(builder: (context) {
              List<Products> products = Get.put(CarViewModel()).products;
              print(products);
              if (products.isNotEmpty) {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final productList = products[index];
                    return WishlistCard(
                      favouriteListProduct: productList,
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No Items in Favourite List"),
                );
              }
            }),
          ),
        );
      },
    );
  }
}
