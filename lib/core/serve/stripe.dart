import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:wirless/ApiStripe.dart';
import 'package:wirless/core/serve/apiserves.dart';
import 'package:wirless/core/serve/serveise.dart';
import 'package:wirless/data/Models/efermulkey/efermulkey.dart';
import 'package:wirless/data/Models/initpaymentmodel.dart';
import 'package:wirless/data/Models/payment_stripemodel/payment_intent.dart';
import 'package:wirless/data/Models/payment_stripemodel/payment_stripemodel.dart';

class StripeServise {
  final ApiService apiService = ApiService();
  Future<PaymentStripemodel> createPaymentintent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var resposne = await apiService.post(
        body: paymentIntentInputModel.tojson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        contentType: Headers.formUrlEncodedContentType,
        token: ApiStripe.paymentApikey);

    var paymentStripemodel = PaymentStripemodel.fromJson(resposne.data);

    return paymentStripemodel;
  }




  Future initPaymentSheet(
      {required Initpaymentmodelsheet initpaymentmodelsheet}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initpaymentmodelsheet.clintSecret,
        // applePay: PaymentSheetApplePay(merchantCountryCode: "US"),
        // customerEphemeralKeySecret:
        //     initpaymentmodelsheet.customerEphemeralKeySecret,
        // customerId: initpaymentmodelsheet.customerId,
        merchantDisplayName: "Wirless Shop",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makepayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentintent(paymentIntentInputModel);
    // var EphemeralKeymodel =
    //     await createEfermulkey(customerId: paymentIntentInputModel.coustmerId);
    var initpaymentmodelsheet = Initpaymentmodelsheet(
      clintSecret: paymentIntentModel.clientSecret!,

      // customerId: paymentIntentInputModel.coustmerId,
      // customerEphemeralKeySecret: EphemeralKeymodel.secret!
    );
    await initPaymentSheet(initpaymentmodelsheet: initpaymentmodelsheet);

    await displayPaymentSheet();
  }

  Future createcoustmer() async {
    Myserveses myserveses = Get.find();
    var resposne = await apiService.post(
      body: {
        "name": myserveses.sharedPreferences.getString("username"),
        "phone": myserveses.sharedPreferences.getString("phone"),
        "email": myserveses.sharedPreferences.getString("email"),
      },
      url: 'https://api.stripe.com/v1/customers',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiStripe.paymentApikey,
    );

    var efermulkey = Efermulkey.fromJson(resposne.data);

    return efermulkey;
  }

  Future<Efermulkey> createEfermulkey({required String customerId}) async {
    var resposne = await apiService.post(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiStripe.paymentApikey,
      headers: {
        'Authorization': "Bearer ${ApiStripe.paymentApikey}",
        'Stripe-Version': "2022-11-15",
      },
    );

    var efermulkey = Efermulkey.fromJson(resposne.data);

    return efermulkey;
  }
}
