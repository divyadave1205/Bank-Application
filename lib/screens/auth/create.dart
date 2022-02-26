import 'package:flutter/material.dart';
import 'package:my_bank/main.dart';
import 'package:my_bank/utilities/color_utilities.dart';
import 'package:my_bank/widget/custom_elevated_button.dart';
import 'package:my_bank/widget/custom_textfield.dart';

import 'log_in.dart';

final phoneNo = TextEditingController();
final pin = TextEditingController();
final emailAddress = TextEditingController();
final name = TextEditingController();
final balance = TextEditingController();
final userName = TextEditingController();

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Please Register Yourself",
                  style: TextStyle(
                    color: ColorUtilities.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter something";
                    }
                  },
                  color: ColorUtilities.black,
                  controller: name,
                  prefixIcon: Icons.person,
                  hintText: "NAME",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Something";
                    } else if (value.length < 10) {
                      return "enter 10 digit mobile No.";
                    } else if (value.length > 10) {
                      return "enter only 10 digit mobile No.";
                    }
                    return null;
                  },
                  color: ColorUtilities.black,
                  controller: phoneNo,
                  prefixIcon: Icons.call,
                  hintText: "PHONE NO.",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern.toString());
                    if (value!.isEmpty) {
                      return "Please enter something";
                    }
                    if (!value.contains(regex)) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                  color: ColorUtilities.black,
                  controller: emailAddress,
                  prefixIcon: Icons.mail,
                  hintText: "EMAIL ADDRESS",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter something";
                    } else if (value.length < 4) {
                      return "Enter 4 digit Pin";
                    } else if (value != pin.text) {
                      return "pin no. is taken...";
                    }
                    return null;
                  },
                  color: ColorUtilities.black,
                  controller: pin,
                  prefixIcon: Icons.lock,
                  hintText: "PIN",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter something";
                    }
                    return null;
                  },
                  color: ColorUtilities.black,
                  controller: balance,
                  prefixIcon: Icons.attach_money,
                  hintText: "BALANCE",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter something";
                    }

                    return null;
                  },
                  color: ColorUtilities.black,
                  controller: userName,
                  prefixIcon: Icons.verified_user,
                  hintText: "USER NAME",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  color: ColorUtilities.black,
                  height: 50,
                  width: 380,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      if (dataList.any(
                          (element) => element.userName == userName.text)) {
                        SnackBar s = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("Username is taken"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(s);
                      }

                      if (dataList.any((element) => element.pin == pin.text)) {
                        SnackBar s = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("pin is taken"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(s);
                      } else {
                        print("dave");
                        dataList.add(
                          UserModel(
                            index: 1,
                            accountNo: generateAccountno(),
                            balance: balance.text,
                            fullname: name.text,
                            phoneNo: phoneNo.text,
                            pin: pin.text,
                            userName: userName.text,
                            emailAddress: emailAddress.text,
                          ),
                        );
                        phoneNo1.clear();
                        pin1.clear();
                        Navigator.pop(context);
                      }
                    }
                  },
                  buttonName: "REGISTER",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
