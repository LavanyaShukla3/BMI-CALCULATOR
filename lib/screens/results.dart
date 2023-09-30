import 'package:flutter/material.dart';
import 'konstants.dart';
import 'reusable.dart';
import 'bottomButtom.dart';
import 'input_page.dart.dart';
import 'package:bmi_calculator/Calculations.dart';

class  Results extends StatelessWidget {

  Results({required this.bmiResult,
        required this.resultText});

  final String bmiResult;
  final String resultText;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
      'BMI Calculator',
    ),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
        child: Container(
          child:Text(
            'Your Results',
            style: kwhiteaboldlarge,
          ),
        ),
        ),
        Expanded(
          flex:5,
          child: reusable(
            colour:kactivecolour,
          cardchild:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Text(
              resultText,
              style: kpinkabold,
            ),
            Text(
              bmiResult,
              style: kwhiteabold,
            ),
            ],
          ),
        ),
        ),
        BottomButton(title: 'RECACULATE', onTap:(){
          Navigator.pop(context);
        },),
      ]
    )
    );

  }
}


