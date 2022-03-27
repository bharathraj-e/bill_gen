import 'package:bill_gen/core/utils/date_formats.dart';
import 'package:bill_gen/pages/invoice_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Widget buildHeader(Context context, InvoiceModel _) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'INVOICE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
      Container(
        // height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text(
                      "Date             ${dateAsReadable(DateTime.now())}",
                    ),
                    SizedBox(height: 4),
                    Text("Invoice No   ${_.invoiceNo}"),
                    SizedBox(height: 4),
                    Text("GST No         ${_.gstIn}"),
                    SizedBox(height: 4),
                    Text("State Code   33TN"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _.companyName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: PdfColors.teal,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 2),
                      Text(
                        _.addressPrimary,
                        style: const TextStyle(lineSpacing: 2),
                        textAlign: TextAlign.right,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
      Divider(
        indent: 20,
        height: 10,
        endIndent: 20,
        color: PdfColors.grey300,
      ),
    ],
  );
}
