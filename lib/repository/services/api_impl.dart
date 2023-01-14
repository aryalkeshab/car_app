import 'dart:convert';

import 'package:car_app/repository/apiResponse/car_model.dart';
import 'package:flutter/services.dart';

class CarRepository {
  final String carBaseUrl = "assets/json_car_data.json";
  Future<List<Categories>> fetchCarData() async {
    var data = await rootBundle.loadString(carBaseUrl);
    final carDataList = json.decode(data);

    return List<Categories>.from(
        carDataList['categories'].map((item) => Categories.fromJson(item)));
  }
}
