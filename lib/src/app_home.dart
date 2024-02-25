import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'utils.dart';
import 'widgets/bottom_app_bar.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  ValueNotifier<int> page = ValueNotifier(0);
  List<Widget> children = [
    const HomeView(),
    const Center(child: Text('Statistics')),
    const Center(child: Text('Cards')),
    const Center(child: Text('Profile')),
  ];

  void _selectedTab(int index) {
    page.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: page,
          builder: (_, index, __) {
            return children.elementAt(index);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        onPressed: () {},
        child: const Icon(IconsaxBold.scan),
      ),
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedTab,
        notchedShape: const CircularNotchedRectangle(),
        selectedColor: purple,
        color: grey,
        items: [
          FABBottomAppBarItem(iconData: IconsaxBold.home, text: 'Home'),
          FABBottomAppBarItem(
              iconData: IconsaxOutline.chart_1, text: 'Statistics'),
          FABBottomAppBarItem(iconData: IconsaxBold.card, text: 'Card'),
          FABBottomAppBarItem(iconData: IconsaxBold.user, text: 'Profile'),
        ],
      ),
    );
  }
}
