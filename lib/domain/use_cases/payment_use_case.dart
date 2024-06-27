import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/payment/PaymentResponse.dart';
import 'package:graduation_project/domain/repos/payment/payment_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class PaymentUseCase extends Cubit {

  PaymentRepo repo;

  PaymentUseCase(this.repo):super(BaseRequestInitialState());


    void execute(String token,String discountCode, String owner,String totalPrice)async{

      Either<Failuer,PaymentResponse> either = await repo.paymentOnline(token, discountCode, owner, totalPrice);

      return either.fold(
              (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
              (data) => emit(BaseRequestSuccessState<PaymentResponse>(data: data)));
    }




}