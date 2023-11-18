import 'package:flutter_application_1/contraints.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularBMIIndicator extends StatelessWidget {
  const CircularBMIIndicator({
    super.key,
    required this.bmi,
  });
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
          style: const NeumorphicStyle(
              intensity: 8,
              depth: 20,
              color: Color(0xffededed),
              boxShape: NeumorphicBoxShape.circle()),
          child: CircularPercentIndicator(
            radius: 100,
            rotateLinearGradient: true,
            lineWidth: 20,
            percent: 0.8,
            animationDuration: 1000,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: kcardcolor,
            progressColor: ksactiveColor,
            center: Text(
              bmi,
              style: TextStyle(fontSize: 45, color: ktextcolor),
            ),
          )),
    );
  }
}
