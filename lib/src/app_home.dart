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

class _AppHomeState extends State<AppHome> with RestorationMixin {
  final RestorableInt _index = RestorableInt(0);
  List<Widget> children = [
    const HomeView(),
    const Center(child: Text('Statistics')),
    const Center(child: Text('Cards')),
    const Center(child: Text('Profile')),
  ];

  @override
  String get restorationId => 'home_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // Register our property to be saved every time it changes,
    // and to be restored every time our app is killed by the OS!
    registerForRestoration(_index, 'nav_bar_index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children.elementAt(_index.value),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        onPressed: () {},
        child: const Icon(IconsaxBold.scan),
      ),
      bottomNavigationBar: FABBottomAppBar(
        key: ValueKey<int>(_index.value),
        onTabSelected: (i) => setState(() => _index.value = i),
        selectedIndex: _index.value,
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
