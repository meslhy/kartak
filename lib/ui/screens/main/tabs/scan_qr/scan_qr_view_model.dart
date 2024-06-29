import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/ui/screens/main/tabs/scan_qr/profile_from_qr/profile_screen.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:graduation_project/ui/widgets/all.dart';
import 'package:injectable/injectable.dart';


@injectable
class ScanQRViewModel extends Cubit{

  ScanQRViewModel():super(BaseRequestInitialState());

  Future<void> scanQR(BuildContext context) async {
    try {
     dynamic qr = await FlutterBarcodeScanner.scanBarcode('#F09F22', 'Cancel', true, ScanMode.QR).then(
             (qr) {
             if(qr == "-1")return;
             navigateTo(context, ProfileFromQRScreen(id: qr));
             }
     );
    } on PlatformException {
      emit(BaseRequestErrorState("Failed to get platform version."));
    }
  }

}