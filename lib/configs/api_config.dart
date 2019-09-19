class ApiConfig {
  static int connectTimeout = 5000;
  static int receiveTimeout = 3000;
  /*
  * @ip = link to api server
  * @port = server port
  */
  // static String baseUrl = 'http://10.0.2.2:5000/api/v1';
  static String baseUrl = 'http://192.168.1.49:5000/api/v1';

  /*
  * Auth links to api
  * @signIn = sign in api link for auth user, return accessTocken and expires
  * @signUp = 
  */
  static String signInUrl = '/Auth/sign-in';
  static String signUpUrl = '/Auth/sign-up';

	/*
  * User links to api
  * @userUrl = 
  * @userSetupUrl = 
  */
	static String userUrl = '/me';
	static String userSetupUrl = '/me/setup';

	/*
  * User links to api
  * @tripUrl = 
  */
	static String tripUrl = '/Trips';
  static String tripSearchUrl = '/Trips/search';
}