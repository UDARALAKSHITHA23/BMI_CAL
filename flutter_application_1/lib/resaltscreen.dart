// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:neumorphic_ui/neumorphic_ui.dart';

import 'package:flutter_application_1/contraints.dart';
import 'package:flutter_application_1/widgets/ciccularbmi_indicator.dart';

class ResaltScreen extends StatelessWidget {
  const ResaltScreen({
    super.key,
    required this.bmi,
    required this.result,
  });
  final String bmi;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 70,
        leading: NeumorphicButton(
          padding: const EdgeInsets.all(5),
          onPressed: () => Navigator.of(context).pop(),
          style: NeumorphicStyle(
            intensity: 1,
            boxShape: const NeumorphicBoxShape.circle(),
            depth: 2,
            color: kbackgroundcolor,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          'YOUR BIM RESULT',
          style: TextStyle(color: ktextcolor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularBMIIndicator(bmi: bmi),
          Text(
            result,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          )
        ],
      ),
    );
  }
}
