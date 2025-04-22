import 'package:cos_challenge/features/vin_input/infrastructure/vin_repository.dart';
import 'package:cos_challenge/features/vin_input/infrastructure/vin_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vinControllerProvider =
    AsyncNotifierProvider<VinController, Map<String, dynamic>?>(
      VinController.new,
    );

class VinController extends AsyncNotifier<Map<String, dynamic>?> {
  late final VinRepository repository;

  @override
  Future<Map<String, dynamic>?> build() async {
    repository = ref.read(vinServiceProvider);
    return null;
  }
}
