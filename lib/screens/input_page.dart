import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/screens/results.dart';
import '../components/IconContent.dart';
import '../components/reusable.dart';
import 'package:bmi_calculator/Calculations.dart';
import 'package:bmi_calculator/components/konstants.dart';
import 'package:bmi_calculator/components/bottomButtom.dart';

import '../components/round_icon_button.dart';

enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  int height = 20;
  int weight = 20;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusable(
                    onPressed: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour:
                        gender == Gender.male ? kactivecolour : kinactivecolour,
                    cardchild: IconContent(
                        icon: FontAwesomeIcons.mars, content: 'Male'),
                  ),
                ),
                Expanded(
                  child: reusable(
                    onPressed: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    colour: gender == Gender.female
                        ? kactivecolour
                        : kinactivecolour,
                    cardchild: IconContent(
                        icon: FontAwesomeIcons.venus, content: 'Female'),
                  ),
                ),
              ],
            ),
          ), //male and female
          Expanded(
            child: reusable(
              colour: kactivecolour,
              cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Height',
                      style: kdesign,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kwhiteabold,
                        ), // Height in number
                        const Text(
                          'cm',
                          style: kdesign,
                        ) //cm
                      ],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(kbarcolour),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 35.0),
                          overlayColor: const Color(0x1fEE869F),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 20.0,
                            max: 220.0,
                            activeColor: Color(kbarcolour),
                            inactiveColor: Colors.grey,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }))
                  ]),
            ),
          ), //height with slider
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: reusable(
                    colour: kactivecolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Weight',
                        ), //height title
                        const SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          weight.toString(),
                          style: kwhiteabold,
                        ), //select height
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusable(
                    colour: kactivecolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Age',
                        ), //height title
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          age.toString(),
                          style: kwhiteabold,
                        ), //select height
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                            ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), //weight nd age with buttons
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              Calculations calc = Calculations(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({required this.icon, required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      //   setState((){
      //     if(icon == FontAwesomeIcons.plus){
      //       weight++;
      //     }
      //     else{
      //       weight--;
      //     }
      //   });
      // },

      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),

      shape: const BeveledRectangleBorder(),
      fillColor: kinactivecolour,
      elevation: 15.0,
      child: Icon(
        icon,
      ),
    );
  }
}
