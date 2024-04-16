import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/ui/screens/auth/signup/register_view_model.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';
import '../../../../domain/di/di.dart';
import '../../../utils/base_request_states.dart';
import '../../../utils/dialog_utils.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/form_label.dart';
import '../../main/main_screen.dart';



class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";



  const RegisterScreen( {super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return  BlocListener(
      bloc: viewModel,
      listener: (context, state){
        if(state is BaseRequestLoadingState){
          showLoading(context);
        }else if (state is BaseRequestSuccessState){
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        }else if(state is BaseRequestErrorState){
          Navigator.pop(context);
          showErrorDialog(context, state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 80),
          child: Column(
            children: [
              BlocBuilder(
                bloc: viewModel,
                builder: (context, state) {
                  if(viewModel.isImageSelected) {
                    return Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: FileImage(viewModel.pickedImage!),
                          radius: 80,
                        ),
                        FloatingActionButton(
                          backgroundColor: AppColors.black,
                          onPressed: (){
                            viewModel.getImage();

                          },
                          child: const Icon(Icons.camera_alt_outlined),
                        ),
                      ],
                    );
                  }else{
                    return Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        const  CircleAvatar(
                          backgroundImage: AssetImage(AppAssets.unknown),
                          radius: 80,
                        ),
                        FloatingActionButton(
                          backgroundColor: AppColors.black,
                          onPressed: (){
                            viewModel.getImage();

                          },
                          child: Icon(Icons.camera_alt_outlined),
                        ),
                      ],
                    );
                  }
                },
              ),


              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: viewModel.registerKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,

                        children: [
                          FormLabelWidget(label: 'Name'),
                          const SizedBox(
                            height: 18,
                          ),
                          CustomTextFormField(
                              hintText: 'enter your name',
                              controller: viewModel.name,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'Please enter first Name';
                                }
                                return null;
                              },
                              type: TextInputType.name),
                          const SizedBox(
                            height: 20,
                          ),
                          FormLabelWidget(label: 'email Address'),
                          const SizedBox(
                            height: 18,
                          ),
                          CustomTextFormField(
                              hintText: 'enter your email Address',
                              controller: viewModel.email,
                              validator:(text){
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
                              } ,
                              type: TextInputType.emailAddress),
                          const SizedBox(
                            height: 20,
                          ),
                          FormLabelWidget(label: 'Phone Number'),
                          const SizedBox(
                            height: 18,
                          ),
                          CustomTextFormField(
                              hintText: 'enter your Phone Number',
                              controller: viewModel.phone,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'Please enter last Name';
                                }
                                return null;
                              },
                              type: TextInputType.emailAddress),
                          const SizedBox(
                            height: 20,
                          ),
                          FormLabelWidget(label: 'Password'),
                          const SizedBox(
                            height: 18,
                          ),
                          CustomTextFormField(
                            hintText: 'enter your password',
                            controller: viewModel.pass,
                            validator: (text) {
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
                          const SizedBox(
                            height: 20,
                          ),
                          FormLabelWidget(label: 'Password Confirmation'),
                          const SizedBox(
                            height: 18,
                          ),
                          CustomTextFormField(
                            hintText: 're-enter your password confirmation',
                            controller: viewModel.rePass,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please re-enter password ';
                              }
                              if (text != viewModel.pass.text) {
                                return "Password doesn't match.";
                              }
                              return null;
                            },
                            type: TextInputType.visiblePassword,
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 56,
                          ),
                          CustomButtonWidget(
                              title: 'Sign Up',
                              onPressed: () {
                                viewModel.register();
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}