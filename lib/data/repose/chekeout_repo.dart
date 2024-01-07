import 'package:dartz/dartz.dart';
import 'package:wirless/core/errors/Failure.dart';
import 'package:wirless/data/Models/payment_stripemodel/payment_intent.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}

