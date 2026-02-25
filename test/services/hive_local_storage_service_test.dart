import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simo_personal_website/modules/core/services/i_local_storage_service.dart';

class MockLocalStorageService extends Mock implements ILocalStorageService {}

void main() {
  group('ILocalStorageService contract', () {
    late ILocalStorageService service;

    setUp(() {
      service = MockLocalStorageService();
    });

    test('get returns null when key is absent', () async {
      when(() => service.get('missing_key')).thenAnswer((_) async => null);

      final result = await service.get('missing_key');

      expect(result, isNull);
      verify(() => service.get('missing_key')).called(1);
    });

    test('get returns stored value after save', () async {
      when(() => service.save('name', 'Simo')).thenAnswer((_) async {});
      when(() => service.get('name')).thenAnswer((_) async => 'Simo');

      await service.save('name', 'Simo');
      final result = await service.get('name');

      expect(result, 'Simo');
    });

    test('save can be called multiple times for same key', () async {
      when(() => service.save('key', any())).thenAnswer((_) async {});
      when(() => service.get('key')).thenAnswer((_) async => 'second');

      await service.save('key', 'first');
      await service.save('key', 'second');
      final result = await service.get('key');

      expect(result, 'second');
    });

    test('save is called with correct arguments', () async {
      when(() => service.save(any(), any())).thenAnswer((_) async {});

      await service.save('portfolio_key', 'portfolio_value');

      verify(() => service.save('portfolio_key', 'portfolio_value')).called(1);
    });
  });
}
