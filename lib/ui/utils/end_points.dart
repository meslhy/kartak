abstract class EndPoints {
  static String baseUrl = "kartak-demo-od0f.onrender.com";
  static String login = "/api/auth";
  static String register = "/api/user";
  static String places = "/api/place";
  static String users = "/api/user";
  static String onlinePayment = "/api/order/checkout-session";
  static String cashPayment = "/api/order";
  static String sendOTP = "/api/auth/forgetPassword";
  static String verificationOTP = "/api/auth/verifyResetCode";
  static String changePass = "/api/auth/updatePassword";
  static String userTransactions = "/api/order/loggedUser";
  static String profile = "/api/auth/currentUser";
  static String review = "/api/review";
  static String updatePhoto = "/api/user/profilePhotoChange";
  static String placeComments = "/api/review/place";

}