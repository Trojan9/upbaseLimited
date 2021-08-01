import 'package:flutter/cupertino.dart';

class Setpageprovider with ChangeNotifier {
  int page = 0;

  void setpage(value) {
    page = value;
    notifyListeners();
  }
}
