import 'dart:math';

class BMICalculatonBrian {
  BMICalculatonBrian({
    required this.height,
    required this.weight,
  });
  final double height;
  final int weight;
  double _bmi = 0;
  String bmiequation() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi < 18.5) {
      return 'your BMI is lower than 18.5 you need eat well';
    } else if (_bmi < 25) {
      return 'your BMI is in the helthy reage keep it up';
    } else if (_bmi < 30) {
      return 'your BMI is above with in the helthy range .do exesice and get its in to helth range';
    } else {
      return 'your bmi is obese range.you shoud tolk helth cere center';
    }
  }
}
