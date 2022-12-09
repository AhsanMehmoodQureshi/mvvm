
import 'package:flutter/foundation.dart';

class ExampleTwoProvider with ChangeNotifier{
  double _range=1.0;
  double get range =>_range;

  setSlider(double val){
    _range=val;
    notifyListeners();
  }

}