import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/use_cases/get_places_use_case.dart';
import 'package:graduation_project/domain/use_cases/payment_use_case.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/home_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/profile_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/scan_qr/scan_qr_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/transaction/transaction_screen.dart';
import 'package:injectable/injectable.dart';
import '../../../shared_locale/helper.dart';
import '../../utils/base_request_states.dart';

@injectable
class MainViewModel extends Cubit {
  SharedPreferenceGlobal sharedPreferenceGlobal;
  GetPlacesUseCase getPlacesUseCase;
   String token = "" ;

  PaymentOnlineUseCase paymentUseCase;
  int indexTab = SharedPreferenceGlobal.getData(key: "lastIndex")??0;
  List<Widget> screens=[
    const HomeScreen(),
     TransactionScreen(),
     ScanQRScreen(),
    const ProfileScreen(),
  ];

  MainViewModel(this.sharedPreferenceGlobal,this.paymentUseCase,this.getPlacesUseCase) :super(BaseRequestInitialState());
  

   changeIndexTab(int index){
    indexTab = index;
  }

  payment(discountCode, owner, totalPrice)async{
     return paymentUseCase.execute(discountCode, owner, totalPrice);
  }

  getToken()async{
     token =(await SharedPrefsUtils().getToken())!;
  }

  getPlaces(){
     return getPlacesUseCase.execute();
  }
}