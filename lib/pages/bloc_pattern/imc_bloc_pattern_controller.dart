import 'dart:async';
import 'dart:math';

import 'package:af_state_manager/pages/bloc_pattern/imc_state.dart';

class ImcBlocPatternController {
  final _imcStreamControler = StreamController<ImcState>.broadcast()
    ..add(ImcState(imc: 0));
  Stream<ImcState> get imcOut => _imcStreamControler.stream;

  Future<void> calculateImc(
      {required double peso, required double altura}) async {
    _imcStreamControler.add(ImcLoadding());
    await Future.delayed(Duration(milliseconds: 700));
    final double imc = peso / pow(altura, 2);
    _imcStreamControler.add(ImcState(imc: imc));
  }

  void dispose() {
    _imcStreamControler.close();
  }
}
