import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/responses/payment/PaymentResponse.dart';
import 'package:graduation_project/domain/repos/payment/payment_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class PaymentCashUseCase extends Cubit{

  PaymentRepo paymentRepo;

  PaymentCashUseCase(this.paymentRepo):super(BaseRequestInitialState());

  execute(String discountCode,String owner,String totalPrice)async{
    Either either =await paymentRepo.paymentCash(discountCode, owner, totalPrice);

    either.fold(
            (fail) => emit(BaseRequestErrorState(fail.errorMessage)),
            (data) => emit(BaseRequestSuccessState<PaymentResponse>(data: data))
    );
  }

}