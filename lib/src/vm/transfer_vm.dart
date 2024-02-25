import 'package:statesaver/src/models/beneficiary.dart';

import '../repo/repository.dart';
import 'base_vm.dart';

enum BeneficiaryType { all, friends, favourite }

class TransferVm extends BaseVm {
  TransferVm({Repository? repo}) {
    _repo = repo ?? Repository();
  }

  late Repository _repo;

  List<Beneficiary> recentBeneficiaries = [];
  List<Beneficiary> beneficiaries = [];

  fetchBeneficiaries([BeneficiaryType type = BeneficiaryType.all]) async {
    final response = await _repo.fetchBeneficiaries(type);
    beneficiaries = response;
    setState(() {});
  }

  fetchRecentBeneficiaries() async {
    final response = await _repo.fetchRecentBeneficiaries();
    recentBeneficiaries = response;
    setState(() {});
  }
}
