import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/home_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/profile_screen.dart';
import 'package:injectable/injectable.dart';


import '../../utils/base_request_states.dart';

@injectable
class MainViewModel extends Cubit {
  int indexTab = 0;
  List<Widget> screens=[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    ProfileScreen(),
  ];

  MainViewModel() :super(BaseRequestInitialState());

  set changeIndexTab(int index){
    indexTab = index;
  }

}