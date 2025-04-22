import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:cos_challenge/features/vehicle_selection/application/vehicle_selection_controller.dart';
import 'package:cos_challenge/features/vehicle_selection/infrastructure/vehicle_option.dart';
import 'package:flutter/material.dart';

class VehicleSelectionScreen extends StatelessWidget {
  final List<VehicleOption> options;

  const VehicleSelectionScreen({required this.options, super.key});

  @override
  Widget build(BuildContext context) {
    final sortedOptions = [...options]
      ..sort((a, b) => b.similarity.compareTo(a.similarity));

    return Scaffold(
      appBar: AppBar(title: Text(VehicleSelectionStrings.selectVehicle)),
      body: ListView.builder(
        itemCount: sortedOptions.length,
        itemBuilder: (context, index) {
          final vehicle = sortedOptions[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text('${vehicle.make} ${vehicle.model}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(vehicle.containerName),
                  Text(
                    '${VehicleSelectionStrings.similarity} ${vehicle.similarity}%',
                  ),
                ],
              ),
              onTap:
                  () => VehicleSelectionController.selectVehicle(
                    context,
                    vehicle,
                  ),
            ),
          );
        },
      ),
    );
  }
}
