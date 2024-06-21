import 'package:flutter/material.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/payment/cash_payment/cash_payment_view_model.dart';
import 'package:graduation_project/ui/screens/payment/widgets/TFF_payment.dart';


class CashPaymentPage extends StatefulWidget {
  @override
  State<CashPaymentPage> createState() => _CashPaymentPageState();
}

class _CashPaymentPageState extends State<CashPaymentPage> {
  CashPaymentViewModel viewModel = getIt();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cash Payment'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              children: [
                buildTextField(labelText: 'Total Price' , controller: viewModel.totalPriceController),
                buildTextField(labelText: 'Discount Code' , controller: viewModel.discountCodeController),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        color: Color.fromRGBO(227, 163, 22, 1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
