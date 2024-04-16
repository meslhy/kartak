import 'package:flutter/material.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';

class TapFeaturesWidget extends StatelessWidget {

  IconData icon ;
  String title;
  VoidCallback fun;
   TapFeaturesWidget({super.key,required this.title,required this.icon,required this.fun});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon),
          ),
          const SizedBox(width: 10,),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_outlined),
        ],
      ),
    );
  }
}
