import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/domain/use_cases/payment_cash_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class CashPaymentViewModel extends Cubit {
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController discountCodeController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  PaymentCashUseCase paymentCashUseCase;

  CashPaymentViewModel(this.paymentCashUseCase):super(BaseRequestInitialState());

  paymentCash(){
    return paymentCashUseCase.execute(discountCodeController.text.trim(), ownerController.text.trim(), totalPriceController.text);
  }

}