import 'package:cos_challenge/core/services/local_storage_service.dart';
import 'package:cos_challenge/features/vin_input/infrastructure/vin_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vinServiceProvider = Provider<VinRepository>((ref) {
  final storage = ref.read(localStorageServiceProvider);
  return VinRepository(storage);
});
