import 'package:dio/dio.dart';
import 'package:blueboard/data/config.dart';

class ApiClient {
  var config = ApiConfig();
  Dio dio = new Dio();

  apiPost(api, formData) async {
    try {
      Response response = await dio.post(config.ip + ':' + config.port + api, data: formData);
      return response;
    } catch (exeption) {
      return exeption;
    }
  }
}
