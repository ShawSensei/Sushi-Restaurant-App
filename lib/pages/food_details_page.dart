import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant_app/components/button.dart';
import 'package:sushi_restaurant_app/utils/colors.dart';

import '../models/food.dart';
import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({super.key, required this.food});

  final Food food;

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;

  void decrementCount() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementCount() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                backgroundColor: kPrimaryColor,
                content: const Text(
                  "Successfully added to cart",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context); // goes to previous screen
                      },
                      icon: Icon(
                        Icons.done_outline_sharp,
                        color: Colors.white,
                      ))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Icon(
                        Icons.star_border_purple500,
                        color: Colors.pinkAccent,
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Indulge in the savory sensation of our salmon sushi, meticulously prepared to perfection at our restaurant. Crafted from premium, fresh salmon and expertly seasoned sushi rice, each bite offers a harmonious blend of flavors and textures. Delight in the buttery richness of the salmon as it melts in your mouth, complemented by a subtle hint of wasabi and soy sauce. Whether enjoyed as an appetizer or a main course, our salmon sushi promises a culinary experience that will leave you craving for more.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(25),
            color: kPrimaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$' + widget.food.price,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          child: IconButton(
                            onPressed: decrementCount,
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          child: IconButton(
                            onPressed: incrementCount,
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 25),
                MyButton(
                  text: "Add to Cart",
                  onTap: addToCart,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
