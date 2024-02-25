import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:statesaver/src/home/summary.dart';
import 'package:statesaver/src/utils.dart';
import 'package:statesaver/src/vm/transfer_vm.dart';

class TransferView extends StatefulWidget {
  const TransferView({super.key});

  static const routeName = 'transfer';

  @override
  State<TransferView> createState() => _TransferViewState();
}

class _TransferViewState extends State<TransferView> {
  ValueNotifier<int> tab = ValueNotifier(0);
  late TransferVm vm;

  @override
  void initState() {
    super.initState();
    vm = TransferVm()
      ..fetchBeneficiaries()
      ..fetchRecentBeneficiaries();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: vm,
        builder: (_, __) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Transfer',
                  style: context.textTheme.headlineSmall,
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Where do you want to transfer?',
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 11),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            // we're changing border color based on if the card is selected
                            color: Color(0xFFF5F7FE),
                            width: 4,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(IconsaxBold.card),
                              SizedBox(width: 12),
                              Text('Select Bank'),
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Transfer to'),
                        Text('See all'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 73,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          if (index == 0) {
                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: Center(
                                    child: Icon(
                                      IconsaxBold.profile_add,
                                      color: purple,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text('Add')
                              ],
                            );
                          }
                          final beneficiary =
                              vm.recentBeneficiaries.elementAt(index);
                          return GestureDetector(
                            onTap: () => Navigator.restorablePushNamed(
                                context, TransferSummary.routeName,
                                arguments: beneficiary.toJson()),
                            child: Column(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: FlutterLogo(),
                                ),
                                const SizedBox(height: 8),
                                Text(beneficiary.name ?? '')
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(width: 20),
                        itemCount: vm.recentBeneficiaries.take(4).length + 1,
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(purple),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            fixedSize: const MaterialStatePropertyAll(
                                Size.fromHeight(56))),
                        onPressed: () {},
                        child: Text(
                          'Continue',
                          style: context.textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 9),
                          Container(
                            width: 48,
                            height: 6,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5E6EB),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const SizedBox(height: 17),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Transfer List'),
                              Text('See More'),
                            ],
                          ),
                          const SizedBox(height: 14),
                          TabBar(
                            onTap: (int? v) {
                              tab.value = v ?? tab.value;
                            },
                            tabs: const [
                              Tab(text: 'All'),
                              Tab(text: 'Friends'),
                              Tab(text: 'Favourite'),
                            ],
                          ),
                          const SizedBox(height: 14),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: const Color(0xFFF4F5F7),
                              filled: true,
                              prefixIcon:
                                  const Icon(IconsaxOutline.search_normal),
                              suffixIcon: const Icon(IconsaxBold.close_circle),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          const SizedBox(height: 14),
                          ValueListenableBuilder(
                              valueListenable: tab,
                              builder: (_, value, __) {
                                return [
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      final beneficiary =
                                          vm.beneficiaries.elementAt(index);
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                child: Center(
                                                  child: Text(index.toString()),
                                                ),
                                              ),
                                              const SizedBox(width: 40),
                                              Column(
                                                children: [
                                                  Text(beneficiary.name ?? ''),
                                                  Text(beneficiary
                                                          .accountNumber ??
                                                      '')
                                                ],
                                              )
                                            ],
                                          ),
                                          Text(beneficiary.bank ?? '')
                                        ],
                                      );
                                    },
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 14),
                                    itemCount: vm.beneficiaries.take(5).length,
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      final beneficiary =
                                          vm.beneficiaries.elementAt(index);
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                child: Center(
                                                  child: Text(index.toString()),
                                                ),
                                              ),
                                              const SizedBox(width: 40),
                                              Column(
                                                children: [
                                                  Text(beneficiary.name ?? ''),
                                                  Text(beneficiary
                                                          .accountNumber ??
                                                      '')
                                                ],
                                              )
                                            ],
                                          ),
                                          Text(beneficiary.bank ?? '')
                                        ],
                                      );
                                    },
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 14),
                                    itemCount: vm.beneficiaries.take(5).length,
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      final beneficiary =
                                          vm.beneficiaries.elementAt(index);
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                child: Center(
                                                  child: Text(index.toString()),
                                                ),
                                              ),
                                              const SizedBox(width: 40),
                                              Column(
                                                children: [
                                                  Text(beneficiary.name ?? ''),
                                                  Text(beneficiary
                                                          .accountNumber ??
                                                      '')
                                                ],
                                              )
                                            ],
                                          ),
                                          Text(beneficiary.bank ?? '')
                                        ],
                                      );
                                    },
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 14),
                                    itemCount: vm.beneficiaries.take(5).length,
                                  ),
                                ].elementAt(value);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
