import 'package:cos_challenge/core/services/local_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userIdProvider = FutureProvider<String?>((ref) async {
  return ref.read(localStorageServiceProvider).getUserId();
});
