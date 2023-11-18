// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculation_.dart';
import 'package:flutter_application_1/resaltscreen.dart';
import 'contraints.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import './widgets/valueselector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender = Gender.male;
  void selectedgender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  double height = 0;
  int age = 1;
  int weight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              genderCard(
                  title: 'MALE',
                  selected: () => selectedgender(Gender.male),
                  isSelected: selectedGender == Gender.male),
              genderCard(
                  title: 'FEMALE',
                  selected: () => selectedgender(Gender.female),
                  isSelected: selectedGender == Gender.female),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              heightSlider(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.53,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueSelector(
                        label: 'Weight',
                        value: weight,
                        onDecrement: () {
                          setState(() {
                            setState(() {
                              if (weight > 0) {
                                weight--;
                              }
                            });
                          });
                        },
                        onIncrement: () {
                          setState(() {
                            if (weight < 200) {
                              weight++;
                            }
                          });
                        },
                      ),
                      ValueSelector(
                        label: 'Age',
                        value: age,
                        onIncrement: () {
                          if (age < 100) {
                            age++;
                          }
                        },
                        onDecrement: () {
                          setState(() {
                            if (age > 1) {
                              age--;
                            }
                          });
                        },
                      )
                    ]),
              )
            ],
          ),
          NeumorphicButton(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.20,
              right: MediaQuery.of(context).size.width * 0.20,
              top: 15,
              bottom: 15,
            ),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
              color: ksactiveColor,
            ),
            child: const Text(
              'Let,s Begin',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (weight != 0 || height < 60) {
                BMICalculatonBrian calc =
                    BMICalculatonBrian(height: height, weight: weight);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResaltScreen(
                      bmi: calc.bmiequation(),
                      result: calc.result(),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Something went Wrong",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Neumorphic heightSlider(BuildContext context) {
    return Neumorphic(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width * 0.38,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Height',
              style: TextStyle(color: ktextcolor, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: SfSlider.vertical(
                thumbIcon: NeumorphicIcon(Icons.circle),
                showTicks: true,
                interval: 20,
                min: 20,
                activeColor: ktextcolor,
                max: 360,
                value: height,
                enableTooltip: true,
                showLabels: true,
                minorTicksPerInterval: 1,
                tooltipPosition: SliderTooltipPosition.right,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector genderCard({
    required String title,
    required bool isSelected,
    required Function()? selected,
  }) {
    return GestureDetector(
      onTap: selected, // Call the selected function when tapped
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          intensity: 0.9,
          depth: 3,
          shape: NeumorphicShape.flat,
          color: isSelected ? ksactiveColor : null,
        ),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.all(18),
          child: Text(title),
        ),
      ),
    );
  }
}

enum Gender { male, female }
