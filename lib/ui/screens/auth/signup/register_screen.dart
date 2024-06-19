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
      child:Form(
        key: viewModel.registerKey,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset(AppAssets.bg,
                  fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 180),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          color: Colors.black,
                          elevation: 15,
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
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
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
                                            child: const Icon(Icons.camera_alt_outlined),
                                          ),
                                        ],
                                      );
                                    }
                                  },
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
                                  child:  Column(
                                    children: [
                                      CustomTextFormField(
                                          hintText:  'User Name',
                                          controller: viewModel.name,
                                          validator: (text){
                                            if (text == null || text.trim().isEmpty) {
                                              return 'Please enter user name';
                                            }
                                            return null;
                                          },
                                          type: TextInputType.text,
                                        notPreIcon: true,
                                      ),
                                      CustomTextFormField(
                                        hintText:  'email',
                                        controller: viewModel.email,
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
                                        type: TextInputType.emailAddress,
                                        notPreIcon: true,
                                      ),
                                      CustomTextFormField(
                                          hintText:  'Phone Number',
                                          controller: viewModel.phone,
                                          validator: (text){
                                            if (text == null || text.trim().isEmpty) {
                                              return 'Please enter user name';
                                            }
                                            return null;
                                          },
                                          type: TextInputType.phone,
                                        notPreIcon: true,

                                      ),
                                      CustomTextFormField(
                                          hintText:  'Password',
                                          controller: viewModel.pass,
                                          validator:(text) {
                                            if (text == null || text.trim().isEmpty) {
                                              return 'Please enter password ';
                                            }
                                            if (text.length < 6) {
                                              return 'Phone number should be at least 6 chrs.';
                                            }
                                            return null;
                                          },
                                          type: TextInputType.emailAddress,
                                        isPassword: true,
                                        notPreIcon: true,

                                      ),
                                      CustomTextFormField(
                                          hintText:  'Confirm Password',
                                          controller: viewModel.rePass,
                                          validator: (text) {
                                            if (text == null || text.trim().isEmpty) {
                                              return 'Please enter password ';
                                            }
                                            if (text.length < 6) {
                                              return 'Phone number should be at least 6 chrs.';
                                            }
                                            return null;
                                          },
                                          type: TextInputType.emailAddress,
                                        isPassword: true,
                                        notPreIcon: true,

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
                                      viewModel.register();
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
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
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
            )),
      ),

    );
  }
}


// Scaffold(
//   backgroundColor: AppColors.primary,
//   body: Padding(
//     padding: const EdgeInsets.only(left: 20.0,right: 20,top: 80),
//     child: Column(
//       children: [
//         BlocBuilder(
//           bloc: viewModel,
//           builder: (context, state) {
//             if(viewModel.isImageSelected) {
//               return Stack(
//                 alignment: AlignmentDirectional.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: FileImage(viewModel.pickedImage!),
//                     radius: 80,
//                   ),
//                   FloatingActionButton(
//                     backgroundColor: AppColors.black,
//                     onPressed: (){
//                       viewModel.getImage();
//
//                     },
//                     child: const Icon(Icons.camera_alt_outlined),
//                   ),
//                 ],
//               );
//             }else{
//               return Stack(
//                 alignment: AlignmentDirectional.center,
//                 children: [
//                   const  CircleAvatar(
//                     backgroundImage: AssetImage(AppAssets.unknown),
//                     radius: 80,
//                   ),
//                   FloatingActionButton(
//                     backgroundColor: AppColors.black,
//                     onPressed: (){
//                       viewModel.getImage();
//
//                     },
//                     child: Icon(Icons.camera_alt_outlined),
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//
//
//         Expanded(
//           child: SingleChildScrollView(
//             reverse: true,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: viewModel.registerKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//
//                   children: [
//                     FormLabelWidget(label: 'Name'),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     CustomTextFormField(
//                         hintText: 'enter your name',
//                         controller: viewModel.name,
//                         validator: (text) {
//                           if (text == null || text.trim().isEmpty) {
//                             return 'Please enter first Name';
//                           }
//                           return null;
//                         },
//                         type: TextInputType.name),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     FormLabelWidget(label: 'email Address'),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     CustomTextFormField(
//                         hintText: 'enter your email Address',
//                         controller: viewModel.email,
//                         validator:(text){
//                           if (text == null || text.trim().isEmpty) {
//                             return 'Please enter email';
//                           }
//                           var emailValid = RegExp(
//                               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                               .hasMatch(text);
//                           if (!emailValid) {
//                             return 'email format not valid';
//                           }
//
//                           return null;
//                         } ,
//                         type: TextInputType.emailAddress),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     FormLabelWidget(label: 'Phone Number'),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     CustomTextFormField(
//                         hintText: 'enter your Phone Number',
//                         controller: viewModel.phone,
//                         validator: (text) {
//                           if (text == null || text.trim().isEmpty) {
//                             return 'Please enter last Name';
//                           }
//                           return null;
//                         },
//                         type: TextInputType.emailAddress),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     FormLabelWidget(label: 'Password'),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     CustomTextFormField(
//                       hintText: 'enter your password',
//                       controller: viewModel.pass,
//                       validator: (text) {
//                         if (text == null || text.trim().isEmpty) {
//                           return 'Please enter password ';
//                         }
//                         if (text.length < 6) {
//                           return 'Phone number should be at least 6 chrs.';
//                         }
//                         return null;
//                       },
//                       type: TextInputType.visiblePassword,
//                       isPassword: true,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     FormLabelWidget(label: 'Password Confirmation'),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     CustomTextFormField(
//                       hintText: 're-enter your password confirmation',
//                       controller: viewModel.rePass,
//                       validator: (text) {
//                         if (text == null || text.trim().isEmpty) {
//                           return 'Please re-enter password ';
//                         }
//                         if (text != viewModel.pass.text) {
//                           return "Password doesn't match.";
//                         }
//                         return null;
//                       },
//                       type: TextInputType.visiblePassword,
//                       isPassword: true,
//                     ),
//                     const SizedBox(
//                       height: 56,
//                     ),
//                     CustomButtonWidget(
//                         title: 'Sign Up',
//                         onPressed: () {
//                           viewModel.register();
//                         })
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
//
// ),