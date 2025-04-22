import 'package:cos_challenge/features/auction_data/presentation/screens/auction_screen.dart';
import 'package:cos_challenge/features/vehicle_selection/application/vehicle_option_mapper.dart';
import 'package:cos_challenge/features/vehicle_selection/infrastructure/vehicle_option.dart';
import 'package:flutter/material.dart';

class VehicleSelectionController {
  static void selectVehicle(BuildContext context, VehicleOption vehicle) {
    final data = VehicleOptionMapper.toAuctionData(vehicle);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AuctionScreen(data: data)),
    );
  }
}
