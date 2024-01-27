import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/profile_view_model.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/widgets/tab_features.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "ProfileScreen";

   ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileViewModel viewModel = getIt();

  @override
  void initState(){
     viewModel.getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      color: const Color.fromRGBO(244, 243, 243, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder(
            bloc: viewModel,
             builder: (context, state) {
               if(state is BaseRequestSuccessState){
                 return Expanded(
                   flex: 7,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const SizedBox(height: 40,),
                       Container(
                         height: 180,
                         width: 180,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           image:  DecorationImage(
                             image: NetworkImage("https://kartak-demo-m6vj.onrender.com/uploads/${viewModel.currentUser!.avatar??""}"),
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                       const SizedBox(height: 20,),
                       Text(
                         ("${viewModel.currentUser?.firstName} ${viewModel.currentUser?.lastName}")??"",
                         style: TextStyle(
                             fontSize: 22,
                             fontWeight: FontWeight.bold,
                             color: AppColors.black
                         ),
                       ),
                       const SizedBox(height: 10,),
                        Text(
                         viewModel.currentUser!.email??"",
                         style: TextStyle(
                             fontSize: 16,
                             color: AppColors.grey
                         ),
                       ),
                       const SizedBox(height: 40,),
                       InkWell(
                         onTap: (){},
                         child: Container(
                           height: 50,
                           width: 180,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               border: Border.all(
                                   color: AppColors.grey
                               )
                           ),
                           child: const Text(
                             "Edit Profile",
                             style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
                                 color: AppColors.titles
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 );
               }else{
                 return Container();
               }
             },
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(50) ,topRight: Radius.circular(50))
              ),
              child:  Padding(
                padding: const EdgeInsets.all(40.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TapFeaturesWidget(title: "Settings", icon: Icons.settings, fun: (){print("done");}),
                      const SizedBox(height: 20,),
                      TapFeaturesWidget(title: "Change Password", icon: Icons.lock, fun: (){print("Lock");})
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
