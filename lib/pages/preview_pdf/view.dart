import 'package:bill_gen/pages/invoice_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart' as pdf;
import 'package:printing/printing.dart';

import 'fun_invoice.dart';

class PreviewInvoicePage extends StatelessWidget {
  const PreviewInvoicePage({
    required this.invoiceModel,
    Key? key,
  }) : super(key: key);
  final InvoiceModel invoiceModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Invoice Preview', style: TextStyle(color: Colors.teal)),
        centerTitle: true,
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        build: (format) => generateInvoice(format, invoiceModel),
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        shouldRepaint: true,
        allowSharing: kDebugMode,
        onError: (_, o) {
          return const Icon(Icons.error, size: 100);
        },
        initialPageFormat: pdf.PdfPageFormat.a4,
      ),
    );
  }
}
