import 'package:flutter/material.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';

class TransactionCard extends StatelessWidget {
  final Color dataColor;
  String title;
  String cashBack;
  String payMethod;
  String date;
  String totalPrice;
  String totalPriceAfterDiscount;


  TransactionCard({
    required this.dataColor ,
    required this.title,
    required this.cashBack,
    required this.totalPrice,
    required this.date,
    required this.payMethod,
    required this.totalPriceAfterDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(0, 0, 0, 0.632),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-6/441926384_1599193970904223_1116018309001295735_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEbu5tVVUlecfAG2xBsCk4Nz4jBRESM2IrPiMFERIzYiqNXR1MgCkmCrr55ikyNzGbDG9P4tIRU9r6UlOcnDcMh&_nc_ohc=sXUQVw0ONUcQ7kNvgEAONPF&_nc_ht=scontent.fcai20-3.fna&oh=00_AYAa_QJCImtg50u-aKjZql2vVWw2RHoRhdvp74wFmQ15ow&oe=667D9D83'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title??"",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: dataColor),
                ),
                Text(
                  "Cash back : $cashBack",
                  style: TextStyle(fontSize: 10, color: dataColor),
                ),
                Text(
                  "Pay type : $payMethod"??"",
                  style: TextStyle(fontSize: 10, color: dataColor),
                ),
                Text(
                  "date : $date"??"",
                  style: TextStyle(fontSize: 10, color: dataColor),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  "$totalPrice EG"??"",
                  style: TextStyle(
                    color: dataColor,
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                    decorationThickness: 3,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "$totalPriceAfterDiscount EG"??"",
                  style: TextStyle(fontSize: 18, color: dataColor ,fontWeight: FontWeight.bold ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
