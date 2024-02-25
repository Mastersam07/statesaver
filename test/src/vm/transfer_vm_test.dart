import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:statesaver/src/repo/repository.dart';
import 'package:statesaver/src/vm/transfer_vm.dart';

import '../../mocks.dart';

void main() {
  group('$TransferVm Tests', () {
    late Repository mockRepository;
    late TransferVm transferVm;
    var listenerCallCount = 0;

    setUp(() {
      mockRepository = MockRepository();
      transferVm = TransferVm(repo: mockRepository);
      listenerCallCount = 0;

      transferVm.addListener(() {
        listenerCallCount++;
      });

      registerFallbackValue(BeneficiaryType.all);
    });

    test('fetchBeneficiaries updates beneficiaries and notifies listeners',
        () async {
      when(() => mockRepository.fetchBeneficiaries(any()))
          .thenAnswer((_) async => []);

      // Act
      await transferVm.fetchBeneficiaries();

      // Assert
      verify(() => mockRepository.fetchBeneficiaries(any())).called(1);
      expect(transferVm.beneficiaries, []);
      expect(listenerCallCount, 1);
    });

    test(
        'fetchRecentBeneficiaries updates recentBeneficiaries and notifies listeners',
        () async {
      when(() => mockRepository.fetchRecentBeneficiaries())
          .thenAnswer((_) async => []);

      // Act
      await transferVm.fetchRecentBeneficiaries();

      // Assert
      verify(() => mockRepository.fetchRecentBeneficiaries()).called(1);
      expect(transferVm.recentBeneficiaries, []);
      expect(listenerCallCount, 1);
    });
  });
}
