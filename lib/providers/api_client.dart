import 'package:dio/dio.dart';
import 'package:blueboard/configs/api_config.dart';

class ApiClient {
  Dio dio;

  ApiClient._privateConstructor();

  static final ApiClient _instance = ApiClient._privateConstructor();

  static ApiClient get instance { return _instance; }

  ApiClient() {
    BaseOptions options = new BaseOptions(
      baseUrl: ApiConfig.baseUrl,
    );
    
    dio = new Dio(options);
  }

  /*
  * Post
  * @url - 
  * @formData - 
  */
  post(url, formData) => dio.post(url, data: formData);

  /*
  * Get
  * @url - 
  * @parameters - 
  */
  get(url, parameters) => dio.get(url, queryParameters: parameters);

  /*
  * Put
  * @url - 
  * @data - 
  */
  put(url, data) => dio.put(url, data: data);
  
  /*
  * Delete
  * @url - 
  * @id - 
  */
  delete(url, id) => dio.delete(url + '/' + id);

  //https://pub.dev/packages/dio#interceptors
}
