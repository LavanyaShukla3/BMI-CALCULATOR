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
        const SizedBox(
          height: 15.0,
        ),
        Text(
          content,
          style: kdesign,
        )
      ],
    );
  }
}

