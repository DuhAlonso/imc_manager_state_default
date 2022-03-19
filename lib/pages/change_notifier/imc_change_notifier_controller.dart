import 'dart:math';

import 'package:flutter/material.dart';

class ImcChangeNotifierController extends ChangeNotifier {
  var imc = 0.0;
  Future<void> calculateImc(
      {required double peso, required double altura}) async {
    imc = 0.0;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 700));
    imc = peso / pow(altura, 2);
    notifyListeners();
  }
}
