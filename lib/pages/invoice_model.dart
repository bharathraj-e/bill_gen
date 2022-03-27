import 'package:flutter/cupertino.dart';

class InvoiceModel {
  InvoiceModel();

  String gstIn = "33BKMPM4218H1Z6";
  String companyName = "Sri Vinayaga Traders";
  String addressPrimary =
      "3/30, Edapadi Main road,\nAmman Kovil, Chettimangkurichi(Po),\nEdapadi(Tk), Salem - 637101\nPh No: +91-944-818-818";
  String invoiceNo = '';

  String billToAddress = '';
  String billToSateCode = '33 TN';
  String billToGST = '';
  String shipToAddress = '';
  String shipToSateCode = '33 TN';
  String shipToGST = '';

  bool isShipToSame = true;

  final List<Product> products = [];
  double get amount {
    double f = 0.0;
    for (var item in products) {
      f += item.total;
    }
    return f;
  }

  double get cGst => amount * 0.14;
  double get sGst => amount * 0.14;
  double get grandTotal => amount + cGst + sGst;
}

class Product {
  String description = '';
  String hsnCode = '25232930';
  int quantity50 = 0;
  double totalWT = 0;
  double rate = 0.0;
  double get total => totalWT * rate;
  final Key key = Key(DateTime.now().millisecondsSinceEpoch.toString());
}
