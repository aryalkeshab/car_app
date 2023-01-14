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
import 'package:intl/intl.dart';

import '../../viewModel/car_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    Get.put(CarViewModel()).fetchProductData(
        SearchParams(dateTime: '', isSorted: false, searchText: ''));
    super.initState();
  }

  void clear() {
    Get.put(CarViewModel()).fetchProductData(
        SearchParams(dateTime: '', isSorted: false, searchText: ''));
    searchController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final carViewModel = Get.put(CarViewModel());
    // final carViewModel = carViewModel;
    final config = SizeConfig(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
              onPressed: () {
                clear();
              },
              icon: const Icon(Icons.delete))
        ],
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
                    controller: searchController,
                    decoration: const InputDecoration(
                        labelText: "Search by name",
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
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              final DateFormat formatter =
                                  DateFormat("yyyy-MM-dd");
                              final String formatted =
                                  formatter.format(pickedDate);

                              carViewModel.fetchProductData(SearchParams(
                                  searchText: '',
                                  dateTime: formatted.toString(),
                                  isSorted: false));

                              Navigator.pop(context);
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
                            Navigator.pop(context);
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
