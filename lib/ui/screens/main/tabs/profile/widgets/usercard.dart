import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;

  const UserCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.role,
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: Colors.white, fontSize: 12)),
                Text(role,
                    style: TextStyle(color: Colors.white70, fontSize: 10)),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Handle delete press
              },
            ),
          ],
        ),
      ),
    );
  }
}
