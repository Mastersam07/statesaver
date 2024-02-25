import 'package:flutter/material.dart';

Color purple = const Color(0XFF5B31A1);
Color grey = const Color(0xFFACBBF3);

extension TextStyle on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
