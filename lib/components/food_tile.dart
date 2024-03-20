import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            food.imagePath,
            height: 140,
          ),
          Text(
            food.name,
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$' + food.price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[800]),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_border_purple500,
                      color: Colors.pinkAccent,
                    ),
                    Text(
                      food.rating,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
