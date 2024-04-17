// ignore_for_file: prefer_const_constructors

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
  const HomeScreen({Key? key}) : super(key: key);

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
    return Container(
      child: Column(
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                        image: AssetImage("assets/images/me.JPG"), fit: BoxFit.cover)),
                margin: EdgeInsets.only(left: 20 ,bottom: 10,top: 10),
              ),
              title: Container(
                child: Row(
                  children: [
                    Text(
                      " KARTAK",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " Card",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(178, 133, 28, 1.0)),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.only(right: 15),
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildListOfPlaces(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListOfPlaces(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => buildItemOfList(),
        separatorBuilder: (context, index) => SizedBox(height: 20),
        itemCount: 7,
      );

  Widget buildItemOfList() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20, left: 30),
            height: 120,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("assets/images/polar.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Polar",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        "- Cafe & Restaurant",
                        style: TextStyle(
                          color: Color.fromARGB(255, 114, 114, 114),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Here is the description.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 12,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.only(right: 25),
                  icon: Icon(Icons.favorite_outline, color: Colors.black ,size: 20,),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      );
}
