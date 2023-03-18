import 'package:flutter/material.dart';
import 'package:sumapp/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, double> FormValue = {'Num1': 0, 'Num2': 0, 'Num3': 0};
  double Sum = 0;
  @override
  Widget build(BuildContext context) {
    FormOnChange(FormKey, InputValue) {
      setState(() {
        FormValue.update(FormKey, (value) => double.parse(InputValue));
      });
    }

    AddSumNum() {
      setState(() {
        Sum = FormValue['Num1']! + FormValue['Num2']! + FormValue['Num3']!;
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ADD SUM',
            style: AppTextStyle(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sum = ${Sum.toString()}',
                style: AppTextStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  FormOnChange('Num1', value);
                },
                decoration: AppInputStyle('First Number'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  onChanged: (value) {
                    FormOnChange('Num2', value);
                  },
                  decoration: AppInputStyle('Second Number')),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  onChanged: (value) {
                    FormOnChange('Num3', value);
                  },
                  decoration: AppInputStyle('Third Number')),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: AppButtonStyle(),
                    onPressed: () {
                      AddSumNum();
                    },
                    child: Text('Sum')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
