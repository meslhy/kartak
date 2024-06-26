import 'package:flutter/material.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';

class PlaceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String owner;

  const PlaceCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.owner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      color: Color.fromARGB(255, 58, 58, 58),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 25,
              backgroundColor: AppColors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white)),
                SizedBox(
                  width: 180,
                  child: Text(subtitle,
                      style: TextStyle(
                          color: Colors.white70,
                        fontSize: 10,
                      ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 8,),
                Text(owner,
                    style: TextStyle(color: Colors.white70, fontSize: 10,fontWeight: FontWeight.bold)),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
