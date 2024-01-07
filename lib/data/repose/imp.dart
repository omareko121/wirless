import 'package:dartz/dartz.dart';
import 'package:wirless/core/errors/Failure.dart';
import 'package:wirless/core/serve/stripe.dart';
import 'package:wirless/data/Models/payment_stripemodel/payment_intent.dart';
import 'package:wirless/data/repose/chekeout_repo.dart';

class imp extends CheckoutRepo {
  final StripeServise servise = StripeServise();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await servise.makepayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errormessage: e.toString()));
    }
  }
}
