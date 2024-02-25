import 'dart:math';

import 'package:statesaver/src/models/debit_card.dart';
import 'package:statesaver/src/models/transaction.dart';

import '../models/beneficiary.dart';
import '../vm/transfer_vm.dart';

class Repository {
  Future<List<Beneficiary>> fetchBeneficiaries(BeneficiaryType type) async {
    return List.generate(
      10,
      (index) => Beneficiary(
        name: 'Beneficiary $index',
        accountNumber: '123456789$index',
        bank: 'Bank $index',
      ),
    );
  }

  Future<List<Beneficiary>> fetchRecentBeneficiaries() async {
    return List.generate(
      5,
      (index) => Beneficiary(
        name: 'Name $index',
        accountNumber: '987654321$index',
        bank: 'Bank $index',
      ),
    );
  }

  Future<List<Transaction>> fetchHistory() async {
    return List.generate(15, (index) {
      final date = DateTime.now().subtract(Duration(days: index));

      final dateString =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

      return Transaction(
        type: TransactionType.fromString(index % 2 == 0 ? 'Credit' : 'Debit'),
        description: 'Transaction $index',
        date: dateString,
        amount: '${Random().nextInt(1000) + 100}.00',
        currency: 'USD',
      );
    });
  }

  Future<List<DebitCard>> fetchCards() async {
    return List.generate(
      3,
      (index) => DebitCard(
        type: 'Visa',
        name: 'Card Holder $index',
        expiry: '12/20${25 + index}',
        number: '**** **** **** ${1000 + index}',
      ),
    );
  }
}
