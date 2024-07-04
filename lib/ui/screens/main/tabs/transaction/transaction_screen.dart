import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/model/responses/transactions/TransactionsResponse.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/home_view_model.dart';
import 'package:graduation_project/ui/screens/main/tabs/transaction/transactions_view_model.dart';
import 'package:graduation_project/ui/screens/main/tabs/transaction/widgets/all.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';
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
   viewModel.getTransactions();
   viewModel.getProfile();
   viewModel.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromARGB(200, 255, 255, 255),
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          // User Card
          BlocBuilder(
            bloc: viewModel.getProfileUseCase,
            builder:(context, state) {
              if(state is BaseRequestSuccessState){
                AuthData user = state.data;
                return Container(
                  height: 160,
                  padding: const EdgeInsets.all(15),
                  margin:
                  const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 40),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    alignment: Alignment.topLeft,
                    child:  Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name??"",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                  "EGP ${user.cashBack??0}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                            ),
                                 const Text("Current CashBack",style: TextStyle(fontSize: 14,color: Colors.amber),),
                               ],
                             ),
                          ],
                        ),
                        const Spacer(),
                         CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(user.cloudImage!.url??""),
                        ),
                      ],
                    ),
                  ),
                );
              }else if(state is BaseRequestErrorState){
                return Text(state.message);
              }else {
                  return BlocBuilder(
                    bloc: viewModel,
                    builder: (context, state){
                      if(state is BaseRequestUserState){
                        AuthData user = state.data.data;
                        return Container(
                          height: 160,
                          padding: const EdgeInsets.all(15),
                          margin:
                          const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 40),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 250, .5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            alignment: Alignment.topLeft,
                            child:  Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.name??"",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "EGP ${user.cashBack??0}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        const Text("Current CashBack",style: TextStyle(fontSize: 14,color: Colors.amber),),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(user.cloudImage!.url??""),
                                ),
                              ],
                            ),
                          ),
                        );
                      }else{
                        return LoadingWidget();
                      }

                    }
                  );


              }
            }
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
              print("state is ....... : $state");
             if(state is BaseRequestSuccessState){
               print("state is ....... : $state");

               List<TransactionData> data = state.data;
               print("state is ....... : ${data[0].owner}");

               if(data.isEmpty) {
                 return const Expanded(
                   child: Center(
                     child: Text(
                       "Not Found Any Transactions",style: TextStyle(
                       color: AppColors.white
                     ),
                     ),
                   ),
               );
               }
               return Expanded(
                 child: ListView.builder(
                   shrinkWrap: true,
                   // physics: const NeverScrollableScrollPhysics(),
                   itemCount: data.length,
                   itemBuilder: (context, index) {
                     return TransactionCard(
                       dataColor: dataColor,
                       title: data[index].place?.name??"",
                       cashBack: data[index].cashBack.toString(),
                       date: data[index].createdAt!.substring(0,9),
                       payMethod: data[index].paymentTypeMethod!,
                       totalPrice: "${data[index].totalPrice}",
                       totalPriceAfterDiscount: "${data[index].totalPriceAfterDiscount??0}",
                       imagUrl: data[index].place?.cloudImage?.url??"",
                     );
                   },
                 ),
               );
             }else if(state is BaseRequestErrorState){
               return Expanded(child: Center(child: Text(state.message,style: TextStyle(color: AppColors.white),),));
             }else{
               return Expanded(child: Center(child: LoadingWidget(),));
             }
            },
          ),

        ],
      ),
    );
  }
}
