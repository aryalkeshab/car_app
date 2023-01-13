abstract class BaseService {
  final String carBaseUrl = "assets/json_car_data.json";

  Future<dynamic> getResponse(String url);
}
