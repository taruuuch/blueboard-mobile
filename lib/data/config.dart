class ApiConfig {
  /*
  * @ip = link to api server
  * @port = server port
  */
  String ip = 'http://10.0.2.2';
  String port = '5000';

  /*
  * Auth link to api
  * @signIn = sign in api link for auth user, return accessTocken and expires
  * @signUp = 
  */
  String signIn = '/api/Users/sign-in';
  String signUp = '/api/Users/sign-up';
}