import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class PaymentDetailsViewModel extends Cubit{

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController discountCodeController = TextEditingController();
  PaymentDetailsViewModel():super(BaseRequestInitialState());



}