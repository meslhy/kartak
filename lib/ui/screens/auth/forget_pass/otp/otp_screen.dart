

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:graduation_project/ui/screens/auth/forget_pass/otp/otp_view_model.dart';
import 'package:graduation_project/ui/screens/auth/forget_pass/send_otp/send_otp_screen.dart';
import 'package:graduation_project/ui/screens/auth/login/login_screen.dart';
import 'package:graduation_project/ui/screens/payment/widgets/TFF_payment.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/widgets/title_text.dart';

import '../../../../../domain/di/di.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/base_request_states.dart';
import '../../../../utils/dialog_utils.dart';

class VerificationOTPScreen extends StatefulWidget {
  static const String routeName = "OtpScreen";
  const VerificationOTPScreen({super.key});

  @override
  State<VerificationOTPScreen> createState() => _VerificationOTPScreenState();
}

class _VerificationOTPScreenState extends State<VerificationOTPScreen> {

  VerificationOTPViewModel viewModel = getIt();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener(
          bloc: viewModel,
          listener: (context, state) {
            if(state is BaseRequestLoadingState)
            {
              showLoading(context);
            }else if (state is BaseRequestSuccessState){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            }else if (state is BaseRequestErrorState){
              Navigator.pop(context);
              showErrorDialog(context, state.message);
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const CircleAvatar(
                    radius: 140,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(AppAssets.kartakLogo),
                  ),
                  buildTextField(
                    labelText: 'Reset code',
                    controller: viewModel.otpController,
                    fun: (text){}
                  ),
                  buildTextField(
                    labelText: 'Password',
                    controller: viewModel.passController,
                      fun: (text){}
                  ),
                  buildTextField(
                    labelText: 'Confirm Password',
                    controller: viewModel.confirmPassController,
                      fun: (text){}
                  ),
                  Container(
                    margin: const EdgeInsets.all(40),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.verificationOTP();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Reset Password',
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
      ),
    );
  }
}
