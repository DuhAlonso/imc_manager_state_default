import 'dart:math';

import 'package:af_state_manager/pages/change_notifier/imc_change_notifier_controller.dart';
import 'package:af_state_manager/widgets/imc_gauges.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChangeNotifierPage extends StatefulWidget {
  ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  final controller = ImcChangeNotifierController();
  final TextEditingController pesoEC = TextEditingController();
  final TextEditingController alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
        title: const Text('Imc Change Notifier'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return ImcGauges(
                        imc: controller.imc,
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      if (controller.imc == 0.00) {
                        return Text('');
                      } else {
                        return Text(
                            'Seu IMC é de ${controller.imc.toStringAsFixed(2)}');
                      }
                    }),
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
                      controller.calculateImc(peso: peso, altura: altura);
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
