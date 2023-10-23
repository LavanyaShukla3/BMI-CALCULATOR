import 'package:flutter/material.dart';
class reusable extends StatelessWidget {

  reusable({required this.colour, this.cardchild, this.OnPress});
  final Color colour;
  final Widget? cardchild;
  final VoidCallback? OnPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnPress,
      child:Container(
      child: cardchild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
      ),
    );
  }
}
