abstract class EndPoints {
  static String baseUrl = "kartak-production.up.railway.app";
  static String login = "/api/auth";
  static String register = "/api/user";
  static String places = "/api/place";
  static String users = "/api/user";
  static String payment = "/api/order/checkout-session";
  static String sendOTP = "/api/v1/users/forgotPassword";
  static String verificationOTP = "/api/v1/users/verifyResetCode";
  static String userTransactions = "/api/order/loggedUser";
  static String profile = "/api/auth/currentUser";

}