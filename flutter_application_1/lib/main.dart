import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 133, 124, 120),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const UserInfoForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserInfoForm extends StatefulWidget {
  const UserInfoForm({Key? key}) : super(key: key);

  @override
  State<UserInfoForm> createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? selectedGender;
  DateTime? selectedDate;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  bool showInfo = false;
  double bmi = 0.0;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _submitForm() {
    setState(() {
      setState(() {
        showInfo = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    bmi = (weight / (height * height)) * 10000;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'USER INFORMATION',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "User Name",
              ),
              controller: nameController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Address",
              ),
              controller: addressController,
            ),
            const SizedBox(height: 20),
            const Text(
              'Gender',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                const Text('Male'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Date of Birth',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _showDatePicker,
                  child: const Text('DOB'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Weight (Kg)",
              ),
              controller: weightController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Height (CM)",
              ),
              controller: heightController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (showInfo)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User Name     --: ${nameController.text}'),
                  Text('Address          --: ${addressController.text}'),
                  Text('Gender            --: ${selectedGender ?? ''}'),
                  Text(
                      'Date of Birth  --: ${selectedDate?.toString().split(' ')[0] ?? ''}'),
                  Text('Weight          --: ${weightController.text} Kgs'),
                  Text('Height          --: ${heightController.text} CMs'),
                  Text(
                    '${nameController.text} BMI  --: ${bmi.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
