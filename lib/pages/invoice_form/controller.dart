import 'package:bill_gen/pages/invoice_model.dart';
import 'package:bill_gen/pages/preview_pdf/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceFormController extends GetxController {
  final InvoiceModel invoiceModel = InvoiceModel();

  var formKey = GlobalKey<FormState>();
  void generate() {
    Get.to(
      () => PreviewInvoicePage(invoiceModel: invoiceModel),
      transition: Transition.rightToLeft,
    );
  }
}
