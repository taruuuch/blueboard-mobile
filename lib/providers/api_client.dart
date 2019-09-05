import 'package:blueboard/providers/token_provider.dart';
import 'package:blueboard/configs/api_config.dart';
import 'package:dio/dio.dart';

class ApiClient {
  Dio dio;
	var _tokenProvider = TokenProvider();

	ApiClient._privateConstructor() {
		BaseOptions options = new BaseOptions(
			baseUrl: ApiConfig.baseUrl,
		);

    dio = new Dio(options);

		dio.interceptors.add(InterceptorsWrapper(
			onRequest: (RequestOptions options) async {
				var token = await _tokenProvider.getToken();

				if (token != null) {
					options.headers['Authorization'] = 'Bearer ' + token.accessToken;
					return options;
				}

				return options;
			},
		));
	}
	
  static final ApiClient _instance = ApiClient._privateConstructor();
	static ApiClient get instance => _instance;

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
}
