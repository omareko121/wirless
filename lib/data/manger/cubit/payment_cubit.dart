import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:wirless/data/Models/payment_stripemodel/payment_intent.dart';
import 'package:wirless/data/repose/chekeout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future makepayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(Paymentloding());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold((l) => emit(PaymentFailure(l.errormessage)),
        (r) => emit(Paymentsuccses()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
