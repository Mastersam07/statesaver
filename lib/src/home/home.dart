import 'dart:math';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:statesaver/src/home/transfer.dart';
import 'package:statesaver/src/utils.dart';
import '../widgets/carousel_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController carouselController = PageController(viewportFraction: .8);

  @override
  Widget build(BuildContext context) {
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
                      child:
                          const Center(child: Icon(IconsaxBold.notification)),
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
            ExpandablePageView.builder(
              controller: carouselController,
              itemCount: 3,
              itemBuilder: (_, index) {
                if (!carouselController.position.haveDimensions) {
                  return const SizedBox();
                }
                return AnimatedBuilder(
                  animation: carouselController,
                  builder: (_, __) => Transform.scale(
                    scale: max(
                      0.8,
                      (1 - (carouselController.page! - index).abs() / 2),
                    ),
                    child: const CarouselCard(),
                  ),
                );
              },
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transacions'),
                      Text('See More'),
                    ],
                  ),
                  const SizedBox(height: 19),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(),
                              SizedBox(width: 14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Transfer To Ahmad F'),
                                  SizedBox(height: 6),
                                  Text('6 Sep, 2024 | 17:02'),
                                ],
                              ),
                            ],
                          ),
                          Text('-\$163.98')
                        ],
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 24),
                    itemCount: 5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
