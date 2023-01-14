import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/apiResponse/product_model.dart';
import 'package:car_app/repository/api_request/search_params.dart';
import 'package:car_app/repository/constants/api_response.dart';
import 'package:car_app/repository/services/api_impl.dart';
import 'package:get/get.dart';

class CarViewModel extends GetxController {
  @override
  void onInit() {
    fetchCarData();
    fetchProductData(
        SearchParams(dateTime: '', isSorted: false, searchText: ''));

    super.onInit();
  }

  List<Products> products = [];
  List<bool> isFavorited = [];

  List<ProductListModel> allProductList = [];

  List<Products> tempsearchList = [];

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  fetchCarData() async {
    update();
    try {
      List<Categories> carModelList = await CarRepository().fetchCarData();
      _apiResponse = ApiResponse.completed(carModelList);
      // print(_apiResponse.data);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    update();
  }

  ApiResponse _allProductApiResponse = ApiResponse.initial('Empty data');

  ApiResponse get allProductApiResponse {
    return _allProductApiResponse;
  }

  fetchProductData(SearchParams searchParams) async {
    try {
      List<ProductListModel> carModelList =
          await CarRepository().fetchAllProductData();
      _allProductApiResponse = ApiResponse.completed(carModelList);
      update();

      if (searchParams.searchText.isNotEmpty) {
        print(1);
        List<ProductListModel> tempProductList = _allProductApiResponse.data;
        allProductList = tempProductList
            .where((element) =>
                element.name
                    .toString()
                    .toLowerCase()
                    .contains(searchParams.searchText!.toLowerCase()) ||
                element.detail
                    .toString()
                    .toLowerCase()
                    .contains(searchParams.searchText!.toLowerCase()))
            .toList();

        update();
      } else if (searchParams.dateTime.isNotEmpty) {
        print("{dateTime}");
        List<ProductListModel> tempProductList = _allProductApiResponse.data;
        // final allProductList = tempProductList.sort((a, b) {
        //   //sorting in ascending order
        //   return DateTime.parse(b.dateAdded!)
        //       .compareTo(DateTime.parse(a.dateAdded!));
        // });
        allProductList = tempProductList
            .where((element) =>
                element.dateAdded
                    .toString()
                    .toLowerCase()
                    .contains(searchParams.dateTime!) ||
                element.detail
                    .toString()
                    .toLowerCase()
                    .contains(searchParams.dateTime!))
            .toList();
        update();
      } else if (searchParams.isSorted == true) {
        List<ProductListModel> tempProductList = _allProductApiResponse.data;
        tempProductList.sort((a, b) => a.name!.compareTo(b.name!));
        allProductList = tempProductList;
        print(allProductList);
        update();
      } else {
        print(2);
        allProductList = _allProductApiResponse.data;
        update();
      }
    } catch (e) {
      _allProductApiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    update();
  }

  // fetchProductData(
  //   String value,

  //   // DateTime dateTime,
  //   // bool isSort,
  // ) async {
  //   update();
  //   try {
  //     List<ProductListModel> carModelList =
  //         await CarRepository().fetchAllProductData();
  //     _allProductApiResponse = ApiResponse.completed(carModelList);
  //     if (value.isNotEmpty) {
  //       print(1);
  //       List<ProductListModel> tempProductList = _allProductApiResponse.data;
  //       allProductList = tempProductList
  //           .where((element) =>
  //               element.name
  //                   .toString()
  //                   .toLowerCase()
  //                   .contains(value.toLowerCase()) ||
  //               element.detail
  //                   .toString()
  //                   .toLowerCase()
  //                   .contains(value.toLowerCase()))
  //           .toList();

  //       update();
  //     } else {
  //       print(2);
  //       allProductList = _allProductApiResponse.data;
  //       update();
  //     }
  //   } catch (e) {
  //     _allProductApiResponse = ApiResponse.error(e.toString());
  //     print(e);
  //   }
  //   update();
  // }
}
