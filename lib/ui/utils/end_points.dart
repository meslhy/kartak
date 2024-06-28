abstract class EndPoints {
  static String baseUrl = "kartak-demo-od0f.onrender.com";
  static String login = "/api/auth";
  static String register = "/api/user";
  static String places = "/api/place";
  static String users = "/api/user";
  static String onlinePayment = "/api/order/checkout-session";
  static String cashPayment = "/api/order";
  static String sendOTP = "/api/v1/users/forgotPassword";
  static String verificationOTP = "/api/v1/users/verifyResetCode";
  static String userTransactions = "/api/order/loggedUser";
  static String profile = "/api/auth/currentUser";
  static String updatePhoto = "/api/user/profilePhotoChange";

}