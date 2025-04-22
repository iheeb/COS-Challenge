import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:cos_challenge/features/vehicle_selection/infrastructure/vehicle_option.dart';

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

class RedirectFailure extends Failure {
  final List<VehicleOption> options;
  RedirectFailure(this.options)
    : super('Multiple matches found. Please select the correct vehicle.');
}
