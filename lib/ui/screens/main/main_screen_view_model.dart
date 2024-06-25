import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/use_cases/payment_use_case.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/home_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/transaction/transaction_screen.dart';
import 'package:injectable/injectable.dart';
import '../../../shared_locale/helper.dart';
import '../../utils/base_request_states.dart';

@injectable
class MainViewModel extends Cubit {
  SharedPreferenceGlobal sharedPreferenceGlobal;
   String token = "" ;

  PaymentUseCase paymentUseCase;
  int indexTab = SharedPreferenceGlobal.getData(key: "lastIndex")??0;
  List<Widget> screens=[
    const HomeScreen(),
     TransactionScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  MainViewModel(this.sharedPreferenceGlobal,this.paymentUseCase) :super(BaseRequestInitialState());
  

   changeIndexTab(int index){
    indexTab = index;
  }

  payment(token, discountCode, owner, totalPrice)async{
     return paymentUseCase.execute(token, discountCode, owner, totalPrice);
  }

  getToken()async{
     token =(await SharedPrefsUtils().getToken())!;
  }
}