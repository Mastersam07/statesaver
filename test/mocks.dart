import 'package:mocktail/mocktail.dart';
import 'package:statesaver/src/models/debit_card.dart';
import 'package:statesaver/src/models/transaction.dart';
import 'package:statesaver/src/repo/repository.dart';

class MockRepository extends Mock implements Repository {}

List<Transaction> mockHistory = [
  Transaction(
      type: TransactionType.credit,
      description: "Salary",
      date: "2023-02-10",
      amount: "1000",
      currency: "USD"),
  Transaction(
      type: TransactionType.debit,
      description: "Groceries",
      date: "2023-02-12",
      amount: "150",
      currency: "USD"),
];
List<DebitCard> mockCards = [
  DebitCard(
      type: "Visa",
      name: "John Doe",
      expiry: "12/25",
      number: "**** **** **** 1234"),
  DebitCard(
      type: "MasterCard",
      name: "Jane Doe",
      expiry: "11/24",
      number: "**** **** **** 5678"),
];
