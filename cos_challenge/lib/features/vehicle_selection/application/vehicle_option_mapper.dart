import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:cos_challenge/features/vehicle_selection/infrastructure/vehicle_option.dart';

class VehicleOptionMapper {
  static Map<String, dynamic> toAuctionData(VehicleOption option) {
    return {
      'model': '${option.make} ${option.model}',
      'price': AppStrings.notAvailable,
      'feedback': option.feedback,
      'positiveCustomerFeedback': option.positiveCustomerFeedback,
      '_fk_uuid_auction': option.uuid,
    };
  }
}
