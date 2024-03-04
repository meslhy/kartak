// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/data/model/responses/loginResponse.dart';
// import 'package:graduation_project/data/utils/shared_utils.dart';
// import 'package:graduation_project/domain/di/di.dart';
// import 'package:graduation_project/ui/screens/auth/login/login_screen.dart';
// import 'package:graduation_project/ui/screens/main/tabs/profile/profile_view_model.dart';
// import 'package:graduation_project/ui/screens/main/tabs/profile/update_picture/update_picture_screen.dart';
// import 'package:graduation_project/ui/screens/main/tabs/profile/widgets/tab_features.dart';
// import 'package:graduation_project/ui/utils/app_colors.dart';
// import 'package:graduation_project/ui/utils/base_request_states.dart';
// import 'package:graduation_project/ui/widgets/error_view.dart';
// import 'package:graduation_project/ui/widgets/loading_widget.dart';
// import 'package:shimmer/shimmer.dart';
//
// class ProfileScreen extends StatefulWidget {
//   static const routeName = "ProfileScreen";
//
//    const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//
//   ProfileViewModel viewModel = getIt();
//
//   @override
//   void initState(){
//     viewModel.getUser();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       color: const Color.fromRGBO(244, 243, 243, 1),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             flex: 7,
//             child:BlocBuilder(
//               bloc: viewModel,
//               builder: (context, state) {
//                 if(state is BaseRequestSuccessState<LoginResponseData>){
//                   return  Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 40,),
//                       InkWell(
//                         onTap: (){
//                       Navigator.pushReplacementNamed(context, UpdatePictureScreen.routeName,);
//                       },
//                         child: Stack(
//                           alignment: AlignmentDirectional.topEnd,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadiusDirectional.circular(20),
//                               child: CachedNetworkImage(
//                                 imageUrl: state.data?.userData?.profilePhoto?.url??"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
//                                 progressIndicatorBuilder: (_, __, progress) => Center(
//                                     child: CircularProgressIndicator(value: progress.progress,color: AppColors.black,)),
//                                 height: 180,
//                                 width: 180,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//
//                             const Padding(
//                               padding: EdgeInsets.all(12.0),
//                               child: Icon(Icons.edit,color: AppColors.white,size: 28,),
//                             )
//
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20,),
//                       Text(
//                         ("${state.data?.userData!.firstName} ${state.data?.userData!.lastName}")??"",
//                         style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.black
//                         ),
//                       ),
//                       const SizedBox(height: 10,),
//                       Text(
//                         state.data?.userData!.email??"",
//                         style: const TextStyle(
//                             fontSize: 16,
//                             color: AppColors.grey
//                         ),
//                       ),
//                       const SizedBox(height: 40,),
//                       InkWell(
//                         onTap: (){},
//                         child: Container(
//                           height: 50,
//                           width: 180,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                   color: AppColors.grey
//                               )
//                           ),
//                           child: const Text(
//                             "Edit Profile",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: AppColors.titles
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }else if (state is BaseRequestErrorState){
//                   return  ErrorView(message: state.message);
//                 }else{
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 40,),
//                       Shimmer.fromColors(
//                           baseColor: Colors.grey[300]!,
//                           highlightColor:  Colors.grey[100]!,
//                           child:  Container(
//                             height: 180,
//                             width: 180,
//                             decoration:BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(20)
//                             ),
//
//                           )
//                       ),
//                       const SizedBox(height: 20,),
//                       Shimmer.fromColors(
//                         baseColor: Colors.grey[300]!,
//                         highlightColor: Colors.grey[100]!,
//                         child: Container(
//                           width: 200,
//                           height: 20,
//                           color: Colors.grey[300],
//                         ),
//                       ),
//                       const SizedBox(height: 10,),
//                       Shimmer.fromColors(
//                         baseColor: Colors.grey[300]!,
//                         highlightColor: Colors.grey[100]!,
//                         child: Container(
//                           width: 150,
//                           height: 20,
//                           color: Colors.grey[300],
//                         ),
//                       ),
//                       const SizedBox(height: 40,),
//                       InkWell(
//                         onTap: (){},
//                         child: Container(
//                           height: 50,
//                           width: 180,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                   color: AppColors.grey
//                               )
//                           ),
//                           child: const Text(
//                             "Edit Profile",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: AppColors.titles
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//               },
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Container(
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(topLeft:Radius.circular(50) ,topRight: Radius.circular(50))
//               ),
//               child:  Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       TapFeaturesWidget(title: "Settings", icon: Icons.settings, fun: (){print("done");}),
//                       const SizedBox(height: 20,),
//                       TapFeaturesWidget(title: "Change Password", icon: Icons.lock, fun: (){print("Lock");}),
//                       const SizedBox(height: 20,),
//                       TapFeaturesWidget(
//                           title: "Logout",
//                           icon: Icons.logout_outlined,
//                           fun: (){
//                             viewModel.logOut();
//                             Navigator.pushReplacementNamed(context,LoginScreen.routeName);
//                           }),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
