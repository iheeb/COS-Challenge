import 'package:cos_challenge/core/exceptions/failure.dart';
import 'package:cos_challenge/features/vin_input/application/vin_controller.dart';
import 'package:cos_challenge/features/vin_input/infrastructure/vin_repository.dart';
import 'package:cos_challenge/features/vin_input/infrastructure/vin_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'vin_controller_test.mocks.dart';

@GenerateMocks([VinRepository])
void main() {
  late ProviderContainer container;
  late MockVinRepository mockRepository;

  setUp(() {
    mockRepository = MockVinRepository();
    container = ProviderContainer(
      overrides: [vinServiceProvider.overrideWithValue(mockRepository)],
    );
  });

  tearDown(() => container.dispose());

  test('emits AsyncData on successful fetch (200)', () async {
    when(
      mockRepository.fetchVin(any),
    ).thenAnswer((_) async => {'model': 'Test'});

    final notifier = container.read(vinControllerProvider.notifier);
    await notifier.fetchVin('12345678901234567');

    await container.pump(); // 💥 ensure state is updated

    final state = container.read(vinControllerProvider);
    expect(state, isA<AsyncData>());
    expect(state.asData?.value, isA<Map<String, dynamic>>());
    expect(state.asData?.value?['model'], equals('Test'));
  });

  test('emits AsyncError on RedirectFailure (300)', () async {
    when(mockRepository.fetchVin(any)).thenThrow(RedirectFailure([]));

    final notifier = container.read(vinControllerProvider.notifier);
    await notifier.fetchVin('123');

    await container.pump();

    final state = container.read(vinControllerProvider);
    expect(state.hasError, true);
    expect(state.error, isA<RedirectFailure>());
  });

  test('emits AsyncError on ServerFailure (400)', () async {
    when(mockRepository.fetchVin(any)).thenThrow(ServerFailure('server'));

    final notifier = container.read(vinControllerProvider.notifier);
    await notifier.fetchVin('456');

    await container.pump();

    final state = container.read(vinControllerProvider);
    expect(state.hasError, true);
    expect(state.error, isA<ServerFailure>());
  });
}
