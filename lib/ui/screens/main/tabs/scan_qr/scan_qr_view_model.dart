import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:injectable/injectable.dart';


@injectable
class ScanQRViewModel extends Cubit{

  ScanQRViewModel():super(BaseRequestInitialState());

  Future<void> scanQR() async {
    try {
     String qr = await FlutterBarcodeScanner.scanBarcode('#F09F22', 'Cancel', false, ScanMode.QR);
      print("qr is : $qr");
    } on PlatformException {
      emit(BaseRequestErrorState("Failed to get platform version."));
    }
  }

}