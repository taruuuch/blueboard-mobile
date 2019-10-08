class ApiConfig {
  static int connectTimeout = 5000;
  static int receiveTimeout = 3000;
  /*
  * @baseUrl = link to api server
  */
  static String baseUrl = 'http://10.0.2.2:5000/api/v1'; //For use server on emulator :)
  // static String baseUrl = 'http://192.168.1.10:5000/api/v1'; //For use server on wifi :)

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
  static String countries = '/countries';
}