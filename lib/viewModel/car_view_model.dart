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
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
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
        List<ProductListModel> tempProductList = _allProductApiResponse.data;

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

        update();
      } else {
        allProductList = _allProductApiResponse.data;
        update();
      }
    } catch (e) {
      _allProductApiResponse = ApiResponse.error(e.toString());
    }
    update();
  }
}
