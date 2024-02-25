import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:statesaver/src/repo/repository.dart';
import 'package:statesaver/src/vm/dashboard_vm.dart';

import '../../mocks.dart';

void main() {
  group('$DashboardVm Tests', () {
    late Repository mockRepository;
    late DashboardVm dashboardVm;
    var listenerCallCount = 0;

    setUp(() {
      mockRepository = MockRepository();
      dashboardVm = DashboardVm(repo: mockRepository);
      listenerCallCount = 0;

      dashboardVm.addListener(() {
        listenerCallCount++;
      });
    });

    test('fetchHistory updates history and notifies listeners', () async {
      when(() => mockRepository.fetchHistory())
          .thenAnswer((_) async => mockHistory);

      // Act
      await dashboardVm.fetchHistory();

      // Assert
      verify(() => mockRepository.fetchHistory()).called(1);
      expect(dashboardVm.history, mockHistory);
      expect(listenerCallCount, 1);
    });

    test('fetchCards updates cards and notifies listeners', () async {
      when(() => mockRepository.fetchCards())
          .thenAnswer((_) async => mockCards);

      // Act
      await dashboardVm.fetchCards();

      // Assert
      verify(() => mockRepository.fetchCards()).called(1);
      expect(dashboardVm.cards, mockCards);
      expect(listenerCallCount, 1);
    });
  });
}
