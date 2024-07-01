import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/model/responses/payment/paymentOnlineResponse.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/payment/cash_payment/cash_payment_view_model.dart';
import 'package:graduation_project/ui/screens/payment/online_payment/online_payment_view_model.dart';
import 'package:graduation_project/ui/screens/payment/widgets/TFF_payment.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:graduation_project/ui/utils/dialog_utils.dart';


class OnlinePaymentPage extends StatefulWidget {

  String owner;
   OnlinePaymentPage({super.key,required this.owner});



  @override
  State<OnlinePaymentPage> createState() => _OnlinePaymentPageState();
}

class _OnlinePaymentPageState extends State<OnlinePaymentPage> {
  OnlinePaymentViewModel viewModel = getIt();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: viewModel.paymentOnlineUseCase,
      listener: (context, state) {

        if(state is BaseRequestLoadingState)
        {
          showLoading(context);
        }else if (state is BaseRequestSuccessState){
          PaymentOnlineResponse data = state.data;
          viewModel.launchURL(data.data?.url??"");
          Navigator.pop(context);
        }else if (state is BaseRequestErrorState){
          showErrorDialog(context, state.message);
        }
      },
      builder:(context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Online Payment'),
              backgroundColor: Colors.black,
            ),
            body:  SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 140,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(AppAssets.kartakLogo),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: viewModel.ownerController..text = widget.owner,
                      cursorColor: const Color.fromRGBO(227, 163, 22, 1), // Set the cursor color
                      decoration: const InputDecoration(
                        labelText: "Owner",
                        floatingLabelStyle: TextStyle(color: Color.fromRGBO(227, 163, 22, 1)),
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 10, 10, 10),
                          fontSize: 15,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(5, 5, 5, 1)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(227, 163, 22, 1)),
                        ),
                      ),
                      style: const TextStyle(
                        decoration: TextDecoration.none, // Ensure no underline on the input text
                      ),
                    ),
                    buildTextField(
                      labelText: 'Total Price',
                      controller: viewModel.totalPriceController
                    ),
                    buildTextField(
                      labelText: 'Discount code',
                      controller: viewModel.discountCodeController
                    ),
                    Container(
                      margin: const EdgeInsets.all(40),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.paymentOnline();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
      }
    );
  }
}
