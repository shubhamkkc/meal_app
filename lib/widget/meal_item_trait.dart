import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            size: 17,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
