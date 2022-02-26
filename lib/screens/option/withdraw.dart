import 'package:flutter/material.dart';
import 'package:my_bank/screens/auth/create.dart';
import 'package:my_bank/screens/option/deposit.dart';
import 'package:my_bank/utilities/color_utilities.dart';
import 'package:my_bank/widget/custom_elevated_button.dart';
import 'package:my_bank/widget/custom_textfield.dart';

final withdraw = TextEditingController();

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final GlobalKey<FormState> formkey2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.white,
      body: Form(
        key: formkey2,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter amount";
                  }
                  return null;
                },
                color: ColorUtilities.black,
                hintText: "Withdraw Amount",
                prefixIcon: Icons.attach_money,
                controller: withdraw,
              ),
              CustomElevatedButton(
                buttonName: "Withdraw",
                color: ColorUtilities.black,
                height: 50,
                onPressed: () {
                  if (formkey2.currentState!.validate()) {
                    print("${withdraw.text}");
                    setState(() {
                      statements.add(
                        TransactionModel(
                          phoneNo: phoneNo.text,
                          name: name.text,
                          amount: withdraw.text,
                          dateTime: DateTime.now(),
                          methodType: Type.withdraw,
                          reason: "You Withdrawed",
                        ),
                      );
                    });

                    Navigator.pop(context);
                    withdraw.clear();
                  }
                },
                width: 380,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
