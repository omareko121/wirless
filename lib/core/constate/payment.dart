class ApiContest {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TXpreUxDSnVZVzFsSWpvaU1UY3dNRFEyTURjME5DNDVNRGczT0RVaWZRLnR4RHlUemJYenlCTXZNajRXcVRXY0lkQkJiNkMxT3RtTDJKZnZERkxlOEtJUVozM1RrMzg4UVFJcWpQa0VvWnhuQWpDUFdTN0N1c1FRRHU1ZHVfQ19n";
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const String integrationIdCard = '440';

  // static String visaUrl =
  //     '$baseUrl/acceptance/iframes/424000?payment_token=$finalToken';
  static String paymentFirstToken = '';
  static String paymentOrderId = '';
}
//   static String finalToken = '';
//   static const String integrationIdCard = 'ENTER_YOUR_INTEGRATION_ID';
//   static const String integrationIdKiosk = 'ENTER_YOUR_INTEGRATION_ID';
//   static String refCode = '';
// }