import 'package:flutter/material.dart';
import '../components/bottomButtom.dart';
import '../components/konstants.dart';
import '../components/reusable.dart';


class  Results extends StatelessWidget {

  Results({required this.bmiResult,
        required this.resultText});

  final String bmiResult;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text(
      'BMI Calculator',
    ),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
        child: Container(
          child:const Text(
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
        BottomButton(title: 'RECALCULATE', onTap:(){
          Navigator.pop(context);
        },),
      ]
    )
    );

  }
}


