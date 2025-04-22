import 'dart:convert';

import 'package:cos_challenge/core/exceptions/failure.dart';
import 'package:cos_challenge/core/services/local_storage_service.dart';
import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:cos_challenge/features/vehicle_selection/infrastructure/vehicle_option.dart';
import 'package:cos_challenge/cos-mock-server/snippet.dart';
import 'package:hive_flutter/hive_flutter.dart';

class VinRepository {
  final LocalStorageService storage;

  VinRepository(this.storage);

  Future<Map<String, dynamic>> fetchVin(String vin) async {
    try {
      final userId = await storage.getUserId();
      final uri = Uri.https('anyUrl');
      final response = await CosChallenge.httpClient.get(
        uri,
        headers: {CosChallenge.user: userId!, 'vin': vin},
      );
      final status = response.statusCode;
      final body = json.decode(response.body);

      switch (status) {
        case 200:
          return _handleSuccess(body);
        case 300:
          throw _handle300(body);
        case 400:
          throw _handle400(body);
        default:
          throw ServerFailure('Try error: Body: $body');
      }
    } catch (e) {
      if (e is RedirectFailure) rethrow;
      if (e is Failure) rethrow;

      final box = await Hive.openBox(HiveStrings.auctionCache);
      final cached = box.get(HiveStrings.cachedAuctionData);
      if (cached != null) {
        return Map<String, dynamic>.from(cached);
      } else {
        throw ServerFailure();
      }
    }
  }

  Map<String, dynamic> _handleSuccess(dynamic decoded) {
    final box = Hive.box(HiveStrings.auctionCache);
    if (decoded is Map<String, dynamic>) {
      box.put(HiveStrings.cachedAuctionData, decoded);
      return decoded;
    } else if (decoded is List) {
      final wrapped = {'options': decoded};
      box.put(HiveStrings.cachedAuctionData, wrapped);
      return wrapped;
    }
    throw ParseFailure();
  }

  Never _handle300(dynamic decoded) {
    if (decoded is List) {
      final options =
          decoded.map((e) {
            return VehicleOption(
              model: e['model'] ?? AppStrings.unknown,
              uuid: e['externalId'] ?? AppStrings.unknown,
              similarity: e['similarity'] ?? 0,
              make: e['make'] ?? AppStrings.notAvailable,
              containerName: e['containerName'],
              feedback: e['feedback'],
              positiveCustomerFeedback: e['positiveCustomerFeedback'],
            );
          }).toList();
      throw RedirectFailure(options);
    }
    throw ParseFailure();
  }

  ServerFailure _handle400(dynamic decoded) {
    if (decoded is Map && decoded.containsKey('message')) {
      return ServerFailure(decoded['message']);
    }
    return ServerFailure('Server Failure: no message');
  }
}
