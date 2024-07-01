import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/domain/use_cases/payment_cash_use_case.dart';
import 'package:graduation_project/domain/use_cases/payment_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';


@injectable
class OnlinePaymentViewModel extends Cubit {
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController discountCodeController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  PaymentOnlineUseCase paymentOnlineUseCase;

  OnlinePaymentViewModel(this.paymentOnlineUseCase):super(BaseRequestInitialState());

  paymentOnline(){
    return paymentOnlineUseCase.execute(discountCodeController.text.trim(), ownerController.text.trim(), totalPriceController.text);
  }

  launchURL(String url) async {

    await launchUrl(Uri.parse(url));

  }
}