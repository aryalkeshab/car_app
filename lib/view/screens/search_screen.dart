import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/apiResponse/product_model.dart';
import 'package:car_app/repository/api_request/search_params.dart';
import 'package:car_app/repository/constants/size_config.dart';
import 'package:car_app/view/widgets/carlist_grid.dart';
import 'package:car_app/view/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../viewModel/car_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    Get.put(CarViewModel()).fetchProductData(SearchParams());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final carViewModel = Get.put(CarViewModel());
    // final carViewModel = carViewModel;
    final config = SizeConfig(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(
            // vertical: config.appVerticalPaddingMedium(),
            horizontal: config.appHorizontalPaddingMedium()),
        child: Column(
          children: [
            config.verticalSpaceSmall(),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    onChanged: (value) {
                      carViewModel.fetchProductData(SearchParams(
                          searchText: value, dateTime: '', isSorted: false));
                    },
                    decoration: const InputDecoration(
                        labelText: "Search by name & details",
                        hintText: "Hundai, EV, etc",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: PopupMenuButton<int>(
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(pickedDate);
                              // String tempDate = DateFormat("yyyy-MM-dd ")
                              //     .parse(pickedDate);

                              carViewModel.fetchProductData(SearchParams(
                                  searchText: '',
                                  dateTime: pickedDate.toString(),
                                  isSorted: false));
                            } else {}
                          },
                          child: const Icon(Icons.date_range),
                        ),
                      ),
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            carViewModel.fetchProductData(SearchParams(
                                searchText: '', dateTime: '', isSorted: true));
                          },
                          child: const Text("A-Z"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            config.verticalSpaceSmall(),
            ProductList(productList: carViewModel.allProductList),
          ],
        ),
      )),
    );
  }
}
