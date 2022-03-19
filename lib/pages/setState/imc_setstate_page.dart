import 'dart:math';

import 'package:af_state_manager/widgets/imc_gaude_range.dart';
import 'package:af_state_manager/widgets/imc_gauges.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcSetstatePage extends StatefulWidget {
  ImcSetstatePage({Key? key}) : super(key: key);

  @override
  State<ImcSetstatePage> createState() => _ImcSetstatePageState();
}

class _ImcSetstatePageState extends State<ImcSetstatePage> {
  final TextEditingController pesoEC = TextEditingController();
  final TextEditingController alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double imc = 0.0;

  Future<void> _calculateImc(
      {required double peso, required double altura}) async {
    setState(() {
      imc = 0;
    });
    await Future.delayed(Duration(milliseconds: 700));

    setState(() {
      imc = peso / pow(altura, 2);
    });
  }

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imc SetState'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ImcGauges(
                  imc: imc,
                ),
                const SizedBox(
                  height: 15,
                ),
                imc == 0.00
                    ? Text('')
                    : Text('Seu IMC é de ${imc.toStringAsFixed(2)}'),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'PESO obrigatório!';
                    }
                  },
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    )
                  ],
                  decoration: InputDecoration(
                    labelText: 'PESO',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'ALTURA obrigatório!';
                    }
                  },
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    )
                  ],
                  decoration: InputDecoration(
                    labelText: 'Altura',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    var formValid = formKey.currentState?.validate() ?? false;

                    if (formValid) {
                      var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt_BR', decimalDigits: 2);
                      double peso = formatter.parse(pesoEC.text) as double;
                      double altura = formatter.parse(alturaEC.text) as double;
                      _calculateImc(peso: peso, altura: altura);
                    }
                  },
                  child: const Text(
                    'Calcular IMC',
                    style: TextStyle(fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
