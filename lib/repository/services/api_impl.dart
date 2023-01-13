import 'dart:convert';

import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:car_app/repository/services/base_service.dart';
import 'package:flutter/services.dart';

class CarRepository {
  final String carBaseUrl = "assets/json_car_data.json";
  late List<CarModel> carDataList;
  Future<List<CarModel>> fetchCarData() async {
    var data = await rootBundle.loadString(carBaseUrl);
    carDataList = json.decode(data);

    return carDataList;
  }
}
