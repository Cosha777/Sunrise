import 'package:dio/dio.dart';
import 'package:sunrise/data/api/api_day.dart';
import 'package:sunrise/data/api/request/get_day_body.dart';

class SunriseService {
  static const baseUrl = 'https://api.sunrise-sunset.org';

  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<ApiDay> getDay(GetDayBody body) async {
    final response = await _dio.get('/json', queryParameters: body.toApi());
    print(response.statusCode);

    return ApiDay.fromApi(response.data);
  }
}
