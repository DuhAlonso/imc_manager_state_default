import 'package:af_state_manager/pages/bloc_pattern/imc_bloc_pattern_page.dart';
import 'package:af_state_manager/pages/change_notifier/change_notifier_page.dart';
import 'package:af_state_manager/pages/setState/imc_setstate_page.dart';
import 'package:af_state_manager/pages/valueNotifier/value_notifier_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () => _goToPage(context, ImcSetstatePage()),
                child: const Text('SetState'),
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () => _goToPage(context, ImcValueNotifier()),
                child: const Text('Value Notifier'),
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () => _goToPage(context, ChangeNotifierPage()),
                child: const Text('Change Notifier'),
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () => _goToPage(context, ImcBlocPatternPage()),
                child: const Text('Streams (Bloc Pattern)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
