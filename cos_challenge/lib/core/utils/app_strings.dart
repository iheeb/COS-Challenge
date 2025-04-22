class AppStrings {
  static const String appName = 'MyApp';
  static const String unknown = 'Unknown';
  static const String notAvailable = 'N/A';
}

class UserIdStrings {
  static const userWelcome = 'Welcome';
  static const userPrompt = 'Enter your unique User ID to get started.';
  static const userIdHint = 'User ID';
  static const userError = 'Please enter a User ID';
  static const userLoadingError = 'Error loading user ID: ';
  static const userContinueButton = 'Continue';
  static const userIdKey = 'user_id';
}

class VinInputStrings {
  static const enterVin = 'Enter Vehicle VIN';
  static const vinPrompt = 'Please enter the VIN of the vehicle.';
  static const vinHint = 'VIN';
  static const vinEmpty = 'VIN cannot be empty';
  static const vinInvalid =
      'Invalid VIN. It should be 17 chars, alphanumeric, no I/O/Q.';
  static const vinSubmit = 'Submit';
}

class VehicleSelectionStrings {
  static const selectVehicle = 'Select Vehicle';
  static const similarity = 'Similarity:';
}

class FailureStrings {
  static const String networkError =
      'No internet connection. Check your network and try again.';
  static const String serverError = 'Server error. Please try again later.';
  static const String parseError =
      'Received unexpected data. Try a different VIN or contact support.';
}

class HiveStrings {
  static const auctionCache = 'auction_cache';
  static const cachedAuctionData = 'cached_auction_data';
}
