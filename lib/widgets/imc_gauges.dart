import 'package:af_state_manager/widgets/imc_gaude_range.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGauges extends StatelessWidget {
  ImcGauges({required this.imc, Key? key}) : super(key: key);

  final double imc;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showFirstLabel: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            ImcGaudeRange(
                color: Colors.blue, start: 12.5, end: 18.5, label: 'MAGREZA'),
            ImcGaudeRange(
                color: Colors.green, start: 18.5, end: 24.5, label: 'NORMAL'),
            ImcGaudeRange(
                color: Colors.yellow[600]!,
                start: 24.5,
                end: 29.9,
                label: 'SOBREPRESO'),
            ImcGaudeRange(
                color: Colors.red[500]!,
                start: 29.9,
                end: 39.9,
                label: 'OBESIDADE'),
            ImcGaudeRange(
                color: Colors.red[900]!,
                start: 39.9,
                end: 47.9,
                label: 'OBESIDADE GRAVE'),
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        )
      ],
    );
  }
}
