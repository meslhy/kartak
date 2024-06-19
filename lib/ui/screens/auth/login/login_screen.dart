import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/shared_locale/helper.dart';
import 'package:graduation_project/ui/screens/auth/login/login_view_model.dart';
import 'package:graduation_project/ui/screens/auth/widgets/all_widgets.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/home_screen.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/widgets/custom_text_form_field.dart';

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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.bg,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 250),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        color: Colors.black,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Theme(
                                data: ThemeData(
                                  textTheme: const TextTheme(
                                    bodyText1: TextStyle(
                                        color: Colors.white), // Text color
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [

                                    CustomTextFormField(
                                        hintText:  'Email',
                                        controller: viewModel.emailController,
                                        validator: (text){
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
                                        type: TextInputType.emailAddress
                                    ),
                                    CustomTextFormField(
                                        hintText:  'Password',
                                        controller: viewModel.passController,
                                        validator:(text) {
                                          if (text == null || text.trim().isEmpty) {
                                            return 'Please enter password ';
                                          }
                                          if (text.length < 6) {
                                            return 'Phone number should be at least 6 chrs.';
                                          }
                                          return null;
                                        },
                                        type: TextInputType.visiblePassword,
                                      isPassword: true,
                                    ),
                                    const SizedBox(height: 20,),
                                    GestureDetector(
                                        onTap: () {
                                          // Handle your sign up link action here
                                        },
                                        child: const Text(
                                          "Forget Password?",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                227, 163, 22, 1.0),
                                            decoration: TextDecoration.underline,
                                          ),
                                        )
                                    ),
                                  ],
                                ),

                              ),
                              Container(
                                width: 190,
                                height: 50,
                                margin: const EdgeInsets.only(top: 30),
                                decoration: BoxDecoration(
                                  //  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    viewModel.login();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return Colors
                                              .transparent; // Disabled color
                                        }
                                        return const Color.fromRGBO(
                                            227, 163, 22, 1.0); // Enabled color
                                      },
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context,RegisterScreen.routeName);
                                },
                                child: const Row(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account ?",
                                        style: TextStyle(
                                          color: Color.fromRGBO(215, 212, 181, 1.0),
                                        ),
                                      ),
                                      Text(
                                        " Sign Up",
                                        style: TextStyle(
                                          color: Color.fromRGBO(227, 163, 22, 1),
                                        ),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))
      ,
    );
  }
}
