import 'package:cos_challenge/core/utils/app_strings.dart';

sealed class Failure {
  final String message;
  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(FailureStrings.networkError);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = FailureStrings.serverError]);
}

class ParseFailure extends Failure {
  ParseFailure() : super(FailureStrings.parseError);
}
