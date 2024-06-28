import 'package:flutter/material.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/scan_qr/scan_qr_view_model.dart';

class ScanQRScreen extends StatelessWidget {

  static const routeName = "ScanQRScreen";

  ScanQRViewModel viewModel = getIt();

  ScanQRScreen({super.key});


  @override
  Widget build(BuildContext context) {
    viewModel.scanQR();
    return const Scaffold();
  }
}
