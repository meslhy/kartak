import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/home_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/profile_screen.dart';
import 'package:injectable/injectable.dart';


import '../../../shared_locale/helper.dart';
import '../../utils/base_request_states.dart';

@injectable
class MainViewModel extends Cubit {
  SharedPreferenceGlobal sharedPreferenceGlobal;
  int indexTab = SharedPreferenceGlobal.getData(key: "lastIndex")??0;
  List<Widget> screens=[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  MainViewModel(this.sharedPreferenceGlobal) :super(BaseRequestInitialState());
  

   changeIndexTab(int index){
    indexTab = index;
  }

}