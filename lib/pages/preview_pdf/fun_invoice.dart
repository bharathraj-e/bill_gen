import 'dart:typed_data';

import 'package:bill_gen/pages/invoice_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import 'invoice/billing_address.dart';
import 'invoice/header.dart';
import 'invoice/rupees_in_words.dart';
import 'invoice/table.dart';

Future<Uint8List> generateInvoice(
    PdfPageFormat pageFormat, InvoiceModel _) async {
  // Create a PDF document.
  final doc = Document();

  var sFont = await PdfGoogleFonts.ubuntuRegular();

  // Add page to the PDF
  doc.addPage(
    MultiPage(
      pageTheme: _buildTheme(
        pageFormat,
        await PdfGoogleFonts.openSansRegular(),
        await PdfGoogleFonts.openSansBold(),
        await PdfGoogleFonts.openSansItalic(),
      ),
      header: (c) => buildHeader(c, _),
      // footer: (c) => _buildFooter(c, _),
      build: (context) => [
        contentBillingAddress(context, _),
        _divider(),
        contentTable(context, _, sFont),
        _divider(),
        contentRupeesInWords(context, _),
        _divider(),
        _buildFooter(context, _),
      ],
    ),
  );

  // Return the PDF file content
  return doc.save();
}

Widget _divider() {
  return Divider(
    indent: 20,
    height: 20,
    endIndent: 20,
    color: PdfColors.grey300,
  );
}

Widget _buildFooter(Context context, InvoiceModel _) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Electronic Ref. No.\nDate',
                style: const TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20),
              Text(
                'Certified that the particulars given above are true and correct and the amount indicated represents the price actually charges and that there is no flow of additional consideration directly or indirectly from the buyer.\nLegal dispute if any if subject to jurisdiction of count of law in Edapadi.',
                style: const TextStyle(fontSize: 9),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 40),
              Text(
                'Lorry Driver Signatory',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'For ${_.companyName},',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 60),
              Text(
                'Authorised Signatory',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

PageTheme _buildTheme(
    PdfPageFormat pageFormat, Font base, Font bold, Font italic) {
  return PageTheme(
    pageFormat: pageFormat,
    theme: ThemeData.base().copyWith(
      defaultTextStyle: TextStyle(
        fontSize: 12,
        color: PdfColors.grey800,
        font: base,
        fontBold: bold,
        fontItalic: italic,
      ),
    ),
    margin: const EdgeInsets.all(35),
    buildBackground: (context) => Container(
      decoration: BoxDecoration(
        color: PdfColors.white,
        border: Border.all(width: 1, color: PdfColors.grey),
      ),
    ),
  );
}
