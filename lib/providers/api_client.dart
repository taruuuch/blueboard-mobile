import 'package:blueboard/models/token.dart';
import 'package:dio/dio.dart';
import 'package:blueboard/configs/api_config.dart';

class ApiClient {
  Dio dio;
	Token token;

  ApiClient._privateConstructor();

  static final ApiClient _instance = ApiClient._privateConstructor();

  static ApiClient get instance { return _instance; }

  ApiClient() {
		BaseOptions options = new BaseOptions(
			baseUrl: ApiConfig.baseUrl,
		);
    
    dio = new Dio(options);

		dio.interceptors.add(InterceptorsWrapper(
			onRequest: (RequestOptions options) {
				options.headers['Authorization'] = 'Bearer ' + token.accessToken;
				return options;
			}
		));
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
  get(url) => dio.get(url);

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
