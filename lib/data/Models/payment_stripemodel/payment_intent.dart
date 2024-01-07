class PaymentIntentInputModel {
  final String amount;
  final String currency;
  // final String coustmerId;

  PaymentIntentInputModel( {required this.amount, required this.currency ,  });

  tojson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
    };
  }
}
