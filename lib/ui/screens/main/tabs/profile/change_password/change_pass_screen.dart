

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/change_password/change_pass_view_model.dart';
import 'package:graduation_project/ui/screens/payment/widgets/TFF_payment.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:graduation_project/ui/utils/dialog_utils.dart';
import 'package:graduation_project/ui/widgets/loading_widget.dart';

class ChangePassScreen extends StatefulWidget {
  static const String routeName = "ChangePassScreen";
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {

  ChangePassViewModel viewModel = getIt();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener(
          bloc: viewModel.changePassUseCase,
          listener: (context, state) {
            if(state is BaseRequestSuccessState)
            {
              Navigator.pop(context);
              Navigator.pop(context);
            }else if (state is BaseRequestErrorState){
              Navigator.pop(context);
              showErrorDialog(context, state.message);
            }else{
              showLoading(context);
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
                    labelText: 'Old Password',
                    controller: viewModel.oldPassController,
                    fun: (text){}
                  ),
                  buildTextField(
                    labelText: 'New Password',
                    controller: viewModel.newPassController,
                      fun: (text){}
                  ),
                  buildTextField(
                    labelText: 'Confirm New Password',
                    controller: viewModel.confirmNewController,
                      fun: (text){}
                  ),
                  Container(
                    margin: const EdgeInsets.all(40),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.changePass();
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
