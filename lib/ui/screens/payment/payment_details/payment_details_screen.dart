import 'package:flutter/material.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/payment/payment_details/payment_details_view_model.dart';
import 'package:graduation_project/ui/screens/payment/widgets/TFF_payment.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {

  PaymentDetailsViewModel viewModel = getIt();
  @override
  Widget build(BuildContext context) {
    final Color fixedColor = Color.fromRGBO(227, 163, 22, 1);

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 70,
          title: Text(
            'Payment Info',
            style: TextStyle(
              color: fixedColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: fixedColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/applogo.jpg',
                    height: 150,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                buildTextField(labelText: 'User Name' , controller:viewModel.userNameController ),
                buildTextField(labelText: 'Email',controller: viewModel.emailController),
                buildTextField(labelText: 'Country' ,controller: viewModel.countryController),
                Row(
                  children: [
                    Expanded(
                      child: buildTextField(labelText: 'City',controller: viewModel.cityController),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: buildTextField(labelText: 'Zip Code',controller: viewModel.zipCodeController),
                    ),
                  ],
                ),
                buildTextField(labelText: 'Phone',controller: viewModel.phoneController),
                buildTextField(labelText: 'Card Number',controller: viewModel.cardNumberController),
                Row(
                  children: [
                    Expanded(
                      child: buildTextField(labelText: 'MM/YY',controller: viewModel.dateController),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: buildTextField(labelText: 'CVC',controller: viewModel.cvcController),
                    ),
                  ],
                ),
                buildTextField(labelText: 'Total Price',controller: viewModel.totalPriceController),
                buildTextField(labelText: ' Discount Code',controller: viewModel.discountCodeController),
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
                          color: Color.fromRGBO(227, 163, 22, 1), fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
