import 'package:flutter/material.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/scan_qr/scan_qr_view_model.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';

class ScanQRScreen extends StatelessWidget {

  static const routeName = "ScanQRScreen";

  ScanQRViewModel viewModel = getIt();

  ScanQRScreen({super.key});


  @override
  Widget build(BuildContext context) {
    viewModel.scanQR(context);
    return  Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Container(
            width:MediaQuery.of(context).size.width *0.8,
            height: 50,
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: (){
                  viewModel.scanQR(context);
                },
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
                child:const Text(
                    "Scan Again",
                  style: TextStyle(
                    color: AppColors.white
                  ),
                ),
            ),
          ),
        ],
      ) ,
    );
  }
}
