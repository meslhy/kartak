import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/model/responses/transactions/TransactionsResponse.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/transaction/transactions_view_model.dart';
import 'package:graduation_project/ui/screens/main/tabs/transaction/widgets/all.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:graduation_project/ui/widgets/loading_widget.dart';


class TransactionScreen extends StatefulWidget {

  static const String routeName = "TransactionScreen";
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

  TransactionsViewModel viewModel = getIt();
  final Color dataColor = const Color.fromRGBO(255, 255, 255, 1);

  //int displayedTransactionCount = 4;

  // void loadMoreTransactions() {
  //   setState(() {
  //     displayedTransactionCount += 4;
  //   });
  // }

  @override
  void initState() {
   viewModel.getTransactions("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjcyYTUwNzlhNDlmMDk5YzAzNmE3ZWYiLCJpYXQiOjE3MTkzMDI4NzcsImV4cCI6MTcxOTM4OTI3N30.YyoiWHea2QpLZ3HrSuYZA8ZvKHNDy16L1g57zTKTCsU");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(236, 255, 255, 255),
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            // User Card
            Container(
              height: 160,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin:
              const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 40),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                alignment: Alignment.topLeft,
                child: const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amera Negm',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '0 EGP',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(AppAssets.unknown),
                    ),
                  ],
                ),
              ),
            ),
            // Last Transactions Header
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 15, bottom: 0),
              child: const Text(
                "Last Transactions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            // List of Transaction Cards
            BlocBuilder(
              bloc: viewModel.getTransactionsUseCase,
              builder: (context, state) {
               if(state is BaseRequestSuccessState){
                 print("state is ....... : $state");
                 List<TransactionData> data = state.data;
                 return ListView.builder(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemCount: data.length,
                   itemBuilder: (context, index) {
                     return TransactionCard(
                       dataColor: dataColor,
                       title: "",
                       cashBack: "${data[index].cashBack}",
                       date: data[index].createdAt!.substring(0,9),
                       payMethod: data[index].paymentTypeMethod!,
                       totalPrice: "${data[index].totalPrice}",
                       totalPriceAfterDiscount: "${data[index].totalPriceAfterDiscount}",
                     );
                   },
                 );
               }else if(state is BaseRequestErrorState){
                 return Center(child: Text(state.message),);
               }else{
                 return Center(child: LoadingWidget(),);
               }
              },
            ),

          ],
        ),
      ),
    );
  }
}
