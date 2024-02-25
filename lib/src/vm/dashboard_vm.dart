import 'package:statesaver/src/models/debit_card.dart';
import 'package:statesaver/src/models/transaction.dart';

import '../repo/repository.dart';
import 'base_vm.dart';

class DashboardVm extends BaseVm {
  DashboardVm({Repository? repo}) {
    _repo = repo ?? Repository();
  }

  late Repository _repo;

  List<Transaction> history = [];
  List<DebitCard> cards = [];

  fetchHistory() async {
    final response = await _repo.fetchHistory();
    history = response;
    setState(() {});
  }

  fetchCards() async {
    final response = await _repo.fetchCards();
    cards = response;
    setState(() {});
  }
}
