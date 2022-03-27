import 'package:bill_gen/pages/invoice_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Widget contentTable(Context context, InvoiceModel _) {
  const List<String> tableHeaders = [
    'S No',
    'Description of Goods',
    'HSN Code',
    'Total Qty in 50Kg Bags',
    'Total Wt. in M.T',
    'Rate / M.T (Rs.)',
    'Amount (Rs.)'
  ];

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Table.fromTextArray(
          border: const TableBorder(
            horizontalInside: BorderSide(
              color: PdfColors.grey300,
              width: 0.5,
            ),
            verticalInside: BorderSide(
              color: PdfColors.grey300,
              width: 0.5,
            ),
            bottom: BorderSide(
              color: PdfColors.grey300,
              width: 1,
            ),
          ),
          cellAlignment: Alignment.center,
          headerDecoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            color: PdfColors.grey200,
          ),
          headerHeight: 25,
          // cellHeight: 40,
          cellAlignments: {
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.centerRight,
            4: Alignment.centerRight,
            5: Alignment.centerRight,
            6: Alignment.centerRight,
          },
          headerStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
          cellStyle: const TextStyle(fontSize: 11),
          headers: tableHeaders,
          data: _.products.asMap().entries.map((entry) {
            final i = entry.key;
            final p = entry.value;
            return [
              '${i + 1}',
              p.description,
              p.hsnCode,
              p.quantity50,
              p.totalWT.toStringAsFixed(2),
              p.rate.toStringAsFixed(2),
              p.total.toStringAsFixed(2),
            ];
          }).toList(),
          headerAlignment: Alignment.center,
          columnWidths: {
            0: const FixedColumnWidth(50),
            1: const FixedColumnWidth(210),
            2: const FixedColumnWidth(90),
            3: const FixedColumnWidth(90),
            4: const FixedColumnWidth(90),
            5: const FixedColumnWidth(60),
          },
        ),
        SizedBox(height: 4),
        _total(_),
      ],
    ),
  );
}

Widget _total(InvoiceModel _) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Taxable Amount'),
          Text('CGST 14%', style: const TextStyle(fontSize: 12)),
          Text('SGST 14%', style: const TextStyle(fontSize: 12)),
          SizedBox(height: 4),
          Text(
            'Total Invoice Amount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(_.amount.toStringAsFixed(2)),
          Text(_.cGst.toStringAsFixed(2), style: const TextStyle(fontSize: 12)),
          Text(_.sGst.toStringAsFixed(2), style: const TextStyle(fontSize: 12)),
          SizedBox(height: 4),
          Text(
            _.grandTotal.toStringAsFixed(2),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  );
}
