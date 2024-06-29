
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/ui/screens/auth/forget_pass/otp/otp_screen.dart';
import 'package:graduation_project/ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart';
import 'package:graduation_project/ui/screens/auth/login/login_screen.dart';
import 'package:graduation_project/ui/screens/payment/widgets/TFF_payment.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/widgets/button.dart';

import '../../../../../domain/di/di.dart';
import '../../../../utils/base_request_states.dart';
import '../../../../utils/dialog_utils.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/description_text.dart';
import '../../../../widgets/title_text.dart';

class SendOtpScreen extends StatefulWidget {
  static const String routeName = "SendOtpScreen";
  const SendOtpScreen({super.key});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  SendOTPViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener(
        bloc: viewModel,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: viewModel.sendOTPKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  CircleAvatar(
                    radius: 140,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(AppAssets.kartakLogo),
                  ),
                  buildTextField(
                    labelText: '  Enter Email to send code',
                    controller: viewModel.emailController,
                    fun: (text){
          if (text == null || text.trim().isEmpty) {
            return 'Please enter email';
          }
          var emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(text);
          if (!emailValid) {
            return 'email format not valid';
          }

          return null;
        },
                  ),
                  Container(
                    margin: EdgeInsets.all(40),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.sendOTP();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Color.fromRGBO(227, 163, 22, 1),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],

              ),
            ),
          ),
        ),
        listener: (context, state) {
          if(state is BaseRequestLoadingState)
          {
            showLoading(context);
          }else if (state is BaseRequestSuccessState){
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, VerificationOTPScreen.routeName);
          }else if (state is BaseRequestErrorState){
            Navigator.pop(context);
            showErrorDialog(context, state.message);
          }
        },

      ),
    );
  }
}
