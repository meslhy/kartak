import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/auth/login/login_view_model.dart';
import 'package:graduation_project/ui/screens/auth/login/widgets/all_widgets.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/base_request_states.dart';
import '../../../utils/dialog_utils.dart';
import '../../main/main_screen.dart';
import '../signup/register_screen.dart';



class LoginScreen extends StatefulWidget {
  static const String routeName = "loginScreen";
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state){
        if(state is BaseRequestLoadingState)
        {
          showLoading(context);
        }else if (state is BaseRequestSuccessState){
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        }else if (state is BaseRequestErrorState){
          Navigator.pop(context);
          showErrorDialog(context, state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primary,
          title:const Text(
            "Login",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),
          toolbarHeight: MediaQuery
              .of(context)
              .size
              .height * .09,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(24),
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width *.8,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color:AppColors.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome back !",
                    style: TextStyle(
                        fontSize: 24,
                        // color:settingsProvider.isDarkEnabled()? AppColors.white:AppColors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),

                textFF(labelText: "email" , controller: viewModel.emailController ),
                const SizedBox(
                  height: 20,
                ),
                textFF(
                  controller: viewModel.passController,
                  labelText: "Password" ,
                  isPass: true,
                  isShown: viewModel.isPass,
                  icon: IconButton(onPressed: (){
                    viewModel.icon = viewModel.isPass ? Icons.remove_red_eye_outlined : Icons.remove_outlined ;
                    setState(() {});
                    viewModel.isPass =!viewModel.isPass;
                  }, icon: Icon(viewModel.icon)),
                ),
                const SizedBox(
                  height: 26,
                ),
                ElevatedButton(
                  onPressed: () {
                   viewModel.login();
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: AppColors.primary)
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(AppColors.primary)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    child: Row(
                      children: [
                        Text("Login", style: TextStyle(fontSize: 18),),
                        Spacer(),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18,),
                InkWell(
                  onTap: () {
                   Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                  child:  const Text(
                    "Create account",
                    // style: TextStyle(fontSize: 18, color: settingsProvider.isDarkEnabled()? AppColors.white:AppColors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
