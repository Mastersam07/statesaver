import 'package:flutter/material.dart';
import 'package:statesaver/src/home/transfer.dart';
import 'package:statesaver/src/utils.dart';

import 'app_home.dart';
import 'home/success.dart';
import 'home/summary.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'statesaverapp',

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xFF15141F),
          ),
          titleTextStyle: TextStyle(
            color: Color(0xFF15141F),
          ),
          backgroundColor: Color(0xFFEFEFEF),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xFF15141F),
          ),
        ),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: const Color(0xFF000000),
          labelStyle: context.textTheme.labelMedium,
        ),
      ),
      darkTheme: ThemeData.dark(useMaterial3: false),

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case TransferView.routeName:
                return const TransferView();
              case TransferSummary.routeName:
                return const TransferSummary();
              case TranseferSuccess.routeName:
                return const TranseferSuccess();
              default:
                return const AppHome();
            }
          },
        );
      },
    );
  }
}
