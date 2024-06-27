import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/domain/use_cases/get_places_use_case.dart';
import 'package:graduation_project/ui/screens/auth/login/login_screen.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/utils/shared_utils.dart';
import '../../../../utils/app_colors.dart';

@injectable
class HomeViewModel extends Cubit{
  AuthResponse? currentUser;
  GetPlacesUseCase getPlacesUseCase;
  HomeViewModel(this.getPlacesUseCase) : super(BaseRequestInitialState());

  getUser()async{
    currentUser = await SharedPrefsUtils().getUser();
    emit(BaseRequestUserState<AuthResponse>(data: currentUser));
  }

  getPlaces(){
    getPlacesUseCase.execute();
  }

  void logout(BuildContext context) {
    showDialog(
      builder:(_) {
        return  AlertDialog(
          content:Container(
            height: MediaQuery.of(context).size.height * .1,
            width: MediaQuery.of(context).size.width * .5,
            child: Column(
              children: [
                const Text(
                  "You want to Log out ?",
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.black)),
                        child:const Text("Cancel",style: TextStyle(fontSize: 18),),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          SharedPrefsUtils().saveUser(AuthResponse());
                          SharedPrefsUtils().saveToken("");
                          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                        },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(
                            0xffc72218))),
                        child:const Text("Logout",style: TextStyle(fontSize: 18),),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          backgroundColor: AppColors.white,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.black)
          ),
        );
      } ,
      context: context ,
      barrierDismissible: false,
    );
  }


}

class BaseRequestUserState<type> extends BaseRequestStates {
  type? data;
  BaseRequestUserState({this.data});
}