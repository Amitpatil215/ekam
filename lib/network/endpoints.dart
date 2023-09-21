class Endpoints {
  Endpoints._();

  static const String baseURL = 'http://system.sofarch.com';
  static const String baseURL1 = 'http://123.108.43.254:8084';

  // Razorpay
  static const razorpay_api_key = "rzp_test_iGzSZ27gG0FXcL";
  static const razorpay_api_secret = "TKuzdhw6gcB6AF0xnMdcijni";

  static const Duration receiveTimeout = Duration(milliseconds: 5000);

  static const Duration connectionTimeout = Duration(milliseconds: 3000);

  static const String genericapiEndpoint = '$baseURL/genericwebapi/genericapi';
  static const String razorPayPayment =
      '$baseURL/GenerateQRCode/Home/CreateRazorPayPaymentLink';
}
