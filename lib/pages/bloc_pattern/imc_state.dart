class ImcState {
  final double imc;

  ImcState({required this.imc});
}

class ImcLoadding extends ImcState {
  ImcLoadding() : super(imc: 0);
}
