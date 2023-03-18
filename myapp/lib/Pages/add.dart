import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Form Validation')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                decoration: InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'cant empty';
                  } else if (value.length < 5) {
                    return 'not allow';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: _passwordcontroller,
                decoration: InputDecoration(hintText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'cant empty';
                  } else if (value.length < 5) {
                    return 'full pass';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 350,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          print('Successful');
                        } else {
                          print('failed');
                        }
                      },
                      child: Text('Login')))
            ],
          ),
        ),
      ),
    );
  }
}
