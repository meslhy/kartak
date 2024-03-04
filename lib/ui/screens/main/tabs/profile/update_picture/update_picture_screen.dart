// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/data/model/responses/loginResponse.dart';
// import 'package:graduation_project/domain/di/di.dart';
// import 'package:graduation_project/ui/screens/main/main_screen.dart';
// import 'package:graduation_project/ui/screens/main/tabs/profile/update_picture/update_picture_view_model.dart';
// import 'package:graduation_project/ui/utils/app_colors.dart';
// import 'package:graduation_project/ui/utils/base_request_states.dart';
// import 'package:graduation_project/ui/widgets/loading_widget.dart';
//
// class UpdatePictureScreen extends StatefulWidget {
//   static const routeName = "UpdatePictureScreen";
//   const UpdatePictureScreen({super.key});
//
//   @override
//   State<UpdatePictureScreen> createState() => _UpdatePictureScreenState();
// }
//
// class _UpdatePictureScreenState extends State<UpdatePictureScreen> {
//   UpdatePictureViewModel viewModel = getIt();
//   @override
//   void initState() {
//     viewModel.getProfileInf();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: (){
//         Navigator.pushReplacementNamed(context, MainScreen.routeName,arguments: 3);
//         return Future.value(false);
//
//       },
//       child: Scaffold(
//         backgroundColor: AppColors.black,
//         body: BlocBuilder(
//           bloc: viewModel.getProfileInfUseCase,
//           builder: (context, state) {
//             print(state);
//             if(state is BaseRequestSuccessState<LoginResponseData>){
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Spacer(),
//                   CachedNetworkImage(
//                     imageUrl:state.data?.userData?.profilePhoto?.url??"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
//                     width:MediaQuery.of(context).size.width ,
//                     height: MediaQuery.of(context).size.height *.5 ,
//                   ),
//                   const SizedBox(height: 100,),
//                   InkWell(
//                     onTap: () {
//                       viewModel.getImageAndUpdate();
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.white,width: 2),
//                         borderRadius: BorderRadius.circular(15)
//                       ),
//                       child: const Text("Edit",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 24),),
//                     ),
//                   ),
//                   const SizedBox(height: 100,),
//                 ],
//               );
//             }else{
//               return LoadingWidget();
//             }
//
//           },
//         ),
//       ),
//     );
//   }
// }
