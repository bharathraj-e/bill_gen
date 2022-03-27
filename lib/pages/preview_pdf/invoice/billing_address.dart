import 'package:bill_gen/pages/invoice_model.dart';
import 'package:pdf/widgets.dart';

Widget contentBillingAddress(Context context, InvoiceModel _) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Recipient (Bill to)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(_.billToAddress, style: const TextStyle(fontSize: 12)),
              SizedBox(height: 4),
              Text('GST No: ${_.billToGST}'),
              Text('State Code: ${_.billToSateCode}'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Consignee (Ship to)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(_.isShipToSame ? _.billToAddress : _.shipToAddress,
                  style: const TextStyle(fontSize: 12)),
              SizedBox(height: 4),
              Row(
                children: [
                  Text('GST No: '),
                  Text(_.isShipToSame ? _.billToGST : _.shipToGST),
                ],
              ),
              Row(
                children: [
                  Text('State Code: '),
                  Text(_.isShipToSame ? _.billToSateCode : _.shipToSateCode),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
