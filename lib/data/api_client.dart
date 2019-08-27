import 'package:dio/dio.dart';
import 'package:blueboard/data/config.dart';

class ApiClient {
  var config = ApiConfig();
  Dio dio = new Dio();

  apiPost(api, formData) async {
    Response res = await dio.post(config.ip + ':' + config.port + api, data: formData);
    print(res.data);
  }
}
