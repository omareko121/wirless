abstract class Failure {
  final String errormessage;

  Failure({required this.errormessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errormessage});
}
