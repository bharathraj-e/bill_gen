import 'package:bill_gen/core/utils/delay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../invoice_form/controller.dart';
import '../invoice_form/view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: GestureDetector(
          onLongPress: _redirect,
          child: const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  void _redirect() async {
    await delay(1500);
    Get.to(
      () => const InvoiceFormPage(),
      binding: BindingsBuilder.put(() => InvoiceFormController()),
      transition: Transition.zoom,
      preventDuplicates: true,
    );
  }
}
