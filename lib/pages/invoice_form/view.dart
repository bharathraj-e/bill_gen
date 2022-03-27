import 'package:bill_gen/pages/invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class InvoiceFormPage extends GetView<InvoiceFormController> {
  const InvoiceFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceFormController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Sri Vinayaga Traders',
              style: TextStyle(color: Colors.teal),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: _.formKey,
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Invoice No',
                              alignLabelWithHint: true,
                            ),
                            onChanged: (s) {
                              _.invoiceModel.invoiceNo = s;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text('Receiver (Bill To)'),
                                leading: Icon(Icons.apartment),
                              ),
                              TextFormField(
                                maxLines: 4,
                                decoration: const InputDecoration(
                                  labelText: 'Address',
                                  alignLabelWithHint: true,
                                ),
                                onChanged: (s) {
                                  _.invoiceModel.billToAddress = s;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                initialValue: _.invoiceModel.billToSateCode,
                                decoration: const InputDecoration(
                                  labelText: 'State Code',
                                  alignLabelWithHint: true,
                                ),
                                onChanged: (s) {
                                  _.invoiceModel.billToSateCode = s;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                initialValue: _.invoiceModel.billToGST,
                                decoration: const InputDecoration(
                                  labelText: 'GST No',
                                  alignLabelWithHint: true,
                                ),
                                onChanged: (s) {
                                  _.invoiceModel.billToGST = s;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('Consignee (Ship to)'),
                                leading: const Icon(Icons.apartment),
                                subtitle: _.invoiceModel.isShipToSame
                                    ? const Text('Same as Bill To')
                                    : null,
                                trailing: Checkbox(
                                  onChanged: (value) {
                                    _.invoiceModel.isShipToSame =
                                        value ?? false;
                                    _.update();
                                  },
                                  value: _.invoiceModel.isShipToSame,
                                ),
                              ),
                              Offstage(
                                offstage: _.invoiceModel.isShipToSame,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      maxLines: 4,
                                      decoration: const InputDecoration(
                                        labelText: 'Address',
                                        alignLabelWithHint: true,
                                      ),
                                      onChanged: (s) {
                                        _.invoiceModel.shipToAddress = s;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      initialValue:
                                          _.invoiceModel.shipToSateCode,
                                      decoration: const InputDecoration(
                                        labelText: 'State Code',
                                        alignLabelWithHint: true,
                                      ),
                                      onChanged: (s) {
                                        _.invoiceModel.shipToSateCode = s;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      initialValue: _.invoiceModel.shipToGST,
                                      decoration: const InputDecoration(
                                        labelText: 'GST No',
                                        alignLabelWithHint: true,
                                      ),
                                      onChanged: (s) {
                                        _.invoiceModel.shipToGST = s;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text('Purchased Items'),
                                leading: Icon(Icons.category),
                              ),
                              const Divider(),
                              const ContentForm(),
                              const SizedBox(height: 10),
                              OutlinedButton.icon(
                                onPressed: () {
                                  _.invoiceModel.products.add(Product());
                                  _.update();
                                },
                                icon: const Icon(Icons.add),
                                label: const Text('Add'),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _.generate,
            child: const Icon(Icons.picture_as_pdf),
          ),
        );
      },
    );
  }
}

class ContentForm extends StatelessWidget {
  const ContentForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceFormController>(
      builder: (_) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: _.invoiceModel.products.length,
          itemBuilder: (BuildContext context, int index) {
            final Product p = _.invoiceModel.products[index];
            return SizedBox(
              key: p.key,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: Text('Item ${index + 1}'),
                      trailing: IconButton(
                        onPressed: () {
                          _.invoiceModel.products
                              .removeWhere((e) => e.key == p.key);
                          _.update();
                        },
                        icon: const Icon(Icons.remove_circle),
                        tooltip: 'Remove item',
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      initialValue: p.description,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Goods Description',
                        alignLabelWithHint: true,
                      ),
                      onChanged: (s) {
                        _.invoiceModel.products[index].description = s;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: p.quantity50 == 0 ? '' : "${p.quantity50}",
                      decoration: const InputDecoration(
                        labelText: 'Total Qty in 50Kg Bags',
                        alignLabelWithHint: true,
                      ),
                      onChanged: (s) {
                        var d = int.tryParse(s);
                        if (d != null) {
                          _.invoiceModel.products[index].quantity50 = d;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: p.totalWT == 0 ? '' : "${p.totalWT}",
                            decoration: const InputDecoration(
                              labelText: 'Total Wt in M.T',
                              alignLabelWithHint: true,
                            ),
                            onChanged: (s) {
                              var d = double.tryParse(s);
                              if (d != null) {
                                _.invoiceModel.products[index].totalWT = d;
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            initialValue: p.rate == 0 ? "" : "${p.rate}",
                            decoration: const InputDecoration(
                              labelText: 'Rate / M.T',
                              alignLabelWithHint: true,
                            ),
                            onChanged: (s) {
                              var d = double.tryParse(s);
                              if (d != null) {
                                _.invoiceModel.products[index].rate = d;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
