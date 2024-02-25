import 'dart:math';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:statesaver/src/home/transfer.dart';
import 'package:statesaver/src/utils.dart';
import '../vm/dashboard_vm.dart';
import '../widgets/carousel_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController carouselController = PageController(viewportFraction: .8);
  late DashboardVm vm;

  @override
  void initState() {
    super.initState();
    vm = DashboardVm()
      ..fetchCards()
      ..fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: vm,
        builder: (context, _) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            FlutterLogo(size: 44),
                            SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Good morning,'),
                                Text('Bruce Wayne'),
                              ],
                            ),
                          ],
                        ),
                        Badge(
                          smallSize: 8,
                          alignment: Alignment.lerp(
                              Alignment.topCenter, Alignment.topRight, .7),
                          padding: EdgeInsets.zero,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: const Color(0xFFFFFFFF),
                            ),
                            width: 44,
                            height: 44,
                            child: const Center(
                                child: Icon(IconsaxBold.notification)),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Account'),
                  ),
                  const SizedBox(height: 22),
                  if (vm.cards.isNotEmpty)
                    ExpandablePageView.builder(
                      controller: carouselController,
                      itemCount: vm.cards.length,
                      itemBuilder: (_, index) {
                        if (!carouselController.position.haveDimensions) {
                          return const SizedBox();
                        }
                        final card = vm.cards.elementAt(index);
                        return AnimatedBuilder(
                          animation: carouselController,
                          builder: (_, __) => Transform.scale(
                            scale: max(
                              0.8,
                              (1 -
                                  (carouselController.page! - index).abs() / 2),
                            ),
                            child: CarouselCard(card: card),
                          ),
                        );
                      },
                    ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: Row(
                          children: [
                            Transform.rotate(
                              angle: pi / 4,
                              child: const Icon(Icons.arrow_downward),
                            ),
                            const SizedBox(width: 4),
                            const Text('Request'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.restorablePushNamed(
                            context, TransferView.routeName),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(33),
                          ),
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: pi / 4,
                                child: const Icon(Icons.arrow_upward),
                              ),
                              const SizedBox(width: 4),
                              const Text('Transfer'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: purple,
                        ),
                        width: 44,
                        height: 44,
                        child: const Center(
                          child: Icon(
                            Icons.qr_code,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Transactions'),
                            Text('See More'),
                          ],
                        ),
                        const SizedBox(height: 19),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            final transaction =
                                vm.history.take(5).elementAt(index);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(),
                                    const SizedBox(width: 14),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(transaction.description ?? ''),
                                        const SizedBox(height: 6),
                                        Text(transaction.humanDate),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  transaction.total,
                                  style:
                                      TextStyle(color: transaction.type?.color),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 24),
                          itemCount: vm.history.take(5).length,
                        ),
                        const SizedBox(height: 9),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
