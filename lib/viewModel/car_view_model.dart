import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/constants/api_response.dart';
import 'package:car_app/repository/constants/snackbar.dart';
import 'package:car_app/repository/constants/toast.dart';
import 'package:car_app/repository/services/api_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchCarData() async {
    update();
    try {
      // List<CarModel> carModelList = await CarRepository().fetchCarData();
      // _apiResponse = ApiResponse.completed(carModelList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    update();
  }

  // ApiResponse _addToCartResponse = ApiResponse();

  // set addToCartResponse(ApiResponse response) {
  //   _addToCartResponse = response;
  //   update();
  // }

  // ApiResponse get addToCartResponse => _addToCartResponse;

  // addToCart(BuildContext context, ) async {
  //   addToCartResponse =
  //       // await Get.find<CartRepository>().addToCartItems(cartParams);
  //   if (addToCartResponse.hasError) {
  //     AppSnackbar.showError(context: context, message: addToCartResponse.error);
  //   }
  //   if (addToCartResponse.hasData) {
  //     showSuccessToast(addToCartResponse.data);
  //   }
  // }

  CarModel carModel = CarModel();
}
