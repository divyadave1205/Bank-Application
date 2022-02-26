import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_bank/main.dart';
import 'package:my_bank/screens/option/banking_options.dart';
import 'package:my_bank/utilities/color_utilities.dart';
import 'package:my_bank/widget/custom_elevated_button.dart';
import 'package:my_bank/widget/custom_textfield.dart';

final phoneNo1 = TextEditingController();
final pin1 = TextEditingController();

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

String accountNo = "";

String generateAccountno() {
  Random r = Random();
  for (int i = 0; i < 3; i++) {
    int randomNumber = r.nextInt(9999);
    accountNo = accountNo + randomNumber.toString();
  }
  return accountNo;
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey3 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.white,
      body: Form(
        key: formkey3,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Please Login For Confirmation",
                  style: TextStyle(
                    color: ColorUtilities.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Something";
                    } else if (value.length < 10) {
                      return "enter 10 digit mobile No.";
                    }
                    return null;
                  },
                  controller: phoneNo1,
                  color: ColorUtilities.black,
                  prefixIcon: Icons.call,
                  hintText: "PHONE NO.",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter something";
                    } else if (value.length < 4) {
                      return "enter 4 digit pin";
                    } else if (value.length > 4) {
                      return "enter 4 digit pin";
                    }
                    return null;
                  },
                  controller: pin1,
                  color: ColorUtilities.black,
                  prefixIcon: Icons.lock,
                  hintText: "PIN",
                ),
                SizedBox(
                  height: 30,
                ),
                CustomElevatedButton(
                  color: ColorUtilities.black,
                  height: 50,
                  width: 380,
                  onPressed: () {
                    if (formkey3.currentState!.validate()) {
                      if (dataList.any(
                        (element) => element.phoneNo != phoneNo1.text,
                      )) {
                        SnackBar s = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("enter valid phone no"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(s);
                      }
                      if (dataList.any(
                        (element) => element.pin != pin1.text,
                      )) {
                        SnackBar s = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("enter valid pin"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(s);
                      }

                      if (dataList.any((element) => element.pin == pin1.text) &&
                          dataList.any(
                              (element) => element.phoneNo == phoneNo1.text)) {
                        final index = dataList.indexWhere(
                            (element) => element.phoneNo == phoneNo1.text);
                        print("${dataList[index].accountNo}");
                      }

                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return BankingOptions();
                      }), (route) => route == MyBank());
                    }
                  },
                  buttonName: "LOG IN",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
