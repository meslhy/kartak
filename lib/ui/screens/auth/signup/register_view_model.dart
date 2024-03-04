import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../data/model/failures.dart';
import '../../../../domain/use_cases/register_use_case.dart';
import '../../../utils/base_request_states.dart';


@injectable
class RegisterViewModel extends Cubit{
  GlobalKey<FormState> registerKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  RegisterUseCase useCase;
  RegisterViewModel(this.useCase):super(BaseRequestInitialState);

  void register() async{
     if(!registerKey.currentState!.validate())return;
    emit(BaseRequestLoadingState());
    Either<Failuer ,bool> response = await
    useCase.execute(name: name.text,email: emailController.text,password: passController.text,passwordConfirm:passwordConfirm.text);

    response.fold(
            (error){
          emit(BaseRequestErrorState(error.errorMessage));
        } ,
            (success) {
          emit(BaseRequestSuccessState());
        });
  }



}