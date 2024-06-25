import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class CashPaymentViewModel extends Cubit {
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController discountCodeController = TextEditingController();
  TextEditingController ownerController = TextEditingController();

  CashPaymentViewModel():super(BaseRequestInitialState());

}