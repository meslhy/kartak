import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/payment/PaymentResponse.dart';
import 'package:graduation_project/data/model/responses/payment/paymentOnlineResponse.dart';
import 'package:graduation_project/domain/repos/payment/payment_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class PaymentOnlineUseCase extends Cubit {

  PaymentRepo repo;

  PaymentOnlineUseCase(this.repo):super(BaseRequestInitialState());


    void execute(String discountCode, String owner,String totalPrice)async{

      Either<Failuer,PaymentOnlineResponse> either = await repo.paymentOnline( discountCode, owner, totalPrice);

      return either.fold(
              (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
              (data) => emit(BaseRequestSuccessState<PaymentOnlineResponse>(data: data)));
    }




}