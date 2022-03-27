import 'package:bill_gen/pages/invoice_model.dart';
import 'package:get/get.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:pdf/widgets.dart';

Widget contentRupeesInWords(Context context, InvoiceModel _) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amount in words ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              _calc(_.grandTotal.toPrecision(2)).capitalizeFirst!,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ),
      ],
    ),
  );
}

String _calc(double d) {
  String s = NumberToWord().convert('en-in', d.toInt());
  s += 'rupees and ';
  var p = ((d - d.toInt()) * 100).toInt();
  s += p == 0 ? 'zero' : NumberToWord().convert('en-in', (p));
  s += ' paise only';
  return s;
}
