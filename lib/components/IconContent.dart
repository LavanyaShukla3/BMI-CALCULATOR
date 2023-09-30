import 'package:flutter/material.dart';
import 'konstants.dart';

class IconContent extends StatelessWidget {

  IconContent({required this.icon, required this.content});
  final IconData icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.black54,
          size: 100.0,
        ),
        Text(
          content,
          style: kdesign,
        )
      ],
    );
  }
}

class Resuable extends StatelessWidget {

  Resuable({required this.colour, this.cardchild});
  final Color colour;
  final Widget? cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}
