import 'package:flutter/material.dart';
import 'konstants.dart';
class BottomButton extends StatelessWidget {

  BottomButton({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(builder:(context) => Results()));
      // },
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kwhiteabold,
          ),
        ),
        // represents bar at the end
        color: Color(kbarcolour),
        height: kbarheight,
        width: double.infinity,
      ),
    );
  }
}


