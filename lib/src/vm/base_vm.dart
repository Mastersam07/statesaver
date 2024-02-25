import 'package:flutter/foundation.dart';

abstract class BaseVm extends ChangeNotifier {
  setState(VoidCallback fn) {
    fn;
    notifyListeners();
  }
}
