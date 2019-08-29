class ApiConfig {
  /*
  * @ip = link to api server
  * @port = server port
  */
  static String baseUrl = 'http://10.0.2.2:5000/api/v1';

  /*
  * Auth link to api
  * @signIn = sign in api link for auth user, return accessTocken and expires
  * @signUp = 
  */
  static String signInUrl = '/Users/sign-in';
  static String signUpUrl = '/Users/sign-up';
}