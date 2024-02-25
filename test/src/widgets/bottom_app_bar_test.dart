import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:statesaver/src/widgets/bottom_app_bar.dart';

void main() {
  // Helper function to create the MaterialApp with FABBottomAppBar
  MaterialApp buildAppWithFABBottomAppBar(
      int selectedIndex, ValueChanged<int> onTabSelected) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: FABBottomAppBar(
          selectedIndex: selectedIndex,
          items: [
            FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
            FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
            FABBottomAppBarItem(
                iconData: Icons.notifications, text: 'Notifications'),
            FABBottomAppBarItem(
                iconData: Icons.account_circle, text: 'Account'),
          ],
          onTabSelected: onTabSelected,
          selectedColor: Colors.blue,
          color: Colors.grey,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.add)),
      ),
    );
  }

  testWidgets('FABBottomAppBar displays correct number of items',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(buildAppWithFABBottomAppBar(0, (_) {}));

    // Find icons within the FABBottomAppBar only
    final fabBottomAppBarIcons = find.byElementPredicate(
      (Element element) =>
          element.widget is Icon &&
          element.findAncestorWidgetOfExactType<FABBottomAppBar>() != null,
    );

    // Verify that exactly 4 icons are found within the FABBottomAppBar
    expect(fabBottomAppBarIcons, findsNWidgets(4));
  });

  testWidgets('FABBottomAppBar updates selectedIndex on tap',
      (WidgetTester tester) async {
    int? selectedIndex;
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(buildAppWithFABBottomAppBar(0, (index) {
      selectedIndex = index;
    }));

    // Tap on the second item
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();

    // Verify that the callback is called with the correct index
    expect(selectedIndex, 1);
  });

  testWidgets('FABBottomAppBar shows selectedColor for selected item',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(buildAppWithFABBottomAppBar(0, (_) {}));

    // Verify that the first item (Home) is highlighted with the selectedColor
    final homeIcon = tester.widget<Icon>(find.byIcon(Icons.home));
    expect(homeIcon.color, Colors.blue);
  });

  testWidgets('FABBottomAppBar uses color for unselected items',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(buildAppWithFABBottomAppBar(0, (_) {}));

    // Verify that the second item (Search) is not highlighted and uses the default color
    final searchIcon = tester.widget<Icon>(find.byIcon(Icons.search));
    expect(searchIcon.color, Colors.grey);
  });
}
