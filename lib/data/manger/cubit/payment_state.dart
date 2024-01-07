part of 'payment_cubit.dart';

sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class Paymentloding extends PaymentState {}

final class Paymentsuccses extends PaymentState {}

final class PaymentFailure extends PaymentState {
  final String errormessage;
  PaymentFailure(this.errormessage);
}
