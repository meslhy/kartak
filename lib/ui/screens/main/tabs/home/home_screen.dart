import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/model/responses/auth_responses/auth_response.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/home_view_model.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';

import '../../../../utils/app_colors.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeRoute";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = getIt();
  @override
  void initState() {
    viewModel.getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsetsDirectional.only(start:32 , end: 32, top:64 ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(context),
            const SizedBox(height: 40,),
            Center(
                child: buildCard(context),
            ),
            const SizedBox(height: 40,),
            buildListOfTransaction(context),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context)=>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      BlocBuilder(
        bloc: viewModel,
        builder: (context, state) {
          if(state is BaseRequestSuccessState){
            AuthResponse data = state.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello,${data.data?.name??""}",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  data.data?.role??"",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight:FontWeight.bold,fontSize: 14),
                ),
              ],
            );
          }else{
            return Text(
              "Hello,",
              style: Theme.of(context).textTheme.labelLarge,
            );
          }
        },
      ),
    ],
  );

  Widget buildCard(BuildContext context) => SizedBox(
    height: MediaQuery.of(context).size.height *0.18,
    width: MediaQuery.of(context).size.width *0.8,
    child: Card(
      elevation: 20,
      color: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Balance",
                style: TextStyle(
                    color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                "\$1.234",
                style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Card",
                style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                "Kartak",
                style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget buildListOfTransaction(BuildContext context)  => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Last Transaction",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.black),
          ),
          TextButton(
              onPressed: (){},
              child: Text(
                "view all",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 20,fontWeight: FontWeight.normal),
              ),
          ),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height *.44,
        child: ListView.separated(
            itemBuilder: (context, index) => buildItemOfLastTransaction(),
            separatorBuilder: (context, index) => const SizedBox(height: 18),
            itemCount: 4),
      )
    ],
  );

  Widget buildItemOfLastTransaction() => Row(
    children: [
       Container(
        height:70 ,
        width: 70,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(30)
        ),
      ),
      const SizedBox(width:12,),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "NetFlix",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 6,),
          Text(
            "Month subscription",
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 18,
            ),
          ),
        ],
      ),
      const Spacer(),
      const Text(
        "\$12",
        style: TextStyle(
          color: AppColors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    ],
  );
}
