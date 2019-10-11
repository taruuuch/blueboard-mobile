class ApiConfig {
  static int connectTimeout = 5000;
  static int receiveTimeout = 3000;
  /*
  * @baseUrl = link to api server
  */
  // static String baseUrl = 'http://10.0.2.2:5000/api/v1'; //For use server on emulator :)
  static String baseUrl = 'http://192.168.1.10:5000/api/v1'; //For use server on wifi :)

  /*
  * Auth links to api
  * @signIn = sign in api link for auth user, return accessTocken and expires
  * @signUp =
  */
  static String signInUrl = '/auth/sign-in';
  static String signUpUrl = '/auth/sign-up';

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
	static String tripUrl = '/trips';
  static String tripSearchUrl = '/trips/search';

	/*
  * Countries link to api
  * @countriesUrl =
  */
  static String countriesUrl = '/countries';


	/*
  * Participants links to api
  * @participantsUrl =
  * @participantsSearchUrl =
  * @participantsInviteUrl =
  */
  static String participantsUrl = '/participants';
  static String participantsSearchUrl = '/participants/search';
  static String participantsInviteUrl = '/participants/invite';
}
