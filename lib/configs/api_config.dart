class ApiConfig {
  /*
  * @ip = link to api server
  * @port = server port
  */
  static String baseUrl = 'http://10.0.2.2:5000/api/v1';

  /*
  * Auth links to api
  * @signIn = sign in api link for auth user, return accessTocken and expires
  * @signUp = 
  */
  static String signInUrl = '/Auth/sign-in';
  static String signUpUrl = '/Auth/sign-up';

	/*
  * User links to api
  * @userDataUrl = 
  */
	static String userUrl = '/me';
	static String userSetupUrl = '/me/setup';
}