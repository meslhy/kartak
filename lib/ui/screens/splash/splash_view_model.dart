import 'package:bloc/bloc.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel extends Cubit {

  // GetProfileInfUseCase getProfileInfUseCase;
  SplashViewModel():super(BaseRequestInitialState());
  //
  // getProfileInf(){
  //   return getProfileInfUseCase.execute();
  // }

}