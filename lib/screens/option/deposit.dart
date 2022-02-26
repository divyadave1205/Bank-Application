import 'package:flutter/material.dart';
import 'package:my_bank/screens/auth/create.dart';
import 'package:my_bank/screens/option/banking_options.dart';
import 'package:my_bank/utilities/color_utilities.dart';
import 'package:my_bank/widget/custom_elevated_button.dart';
import 'package:my_bank/widget/custom_textfield.dart';

final deposit = TextEditingController();

class Deposit extends StatefulWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  final GlobalKey<FormState> formkey1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.white,
      body: Form(
        key: formkey1,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter something...";
                  }
                  return null;
                },
                color: ColorUtilities.black,
                hintText: "Deposit Amount",
                prefixIcon: Icons.attach_money,
                controller: deposit,
              ),
              CustomElevatedButton(
                buttonName: "Deposit",
                color: ColorUtilities.black,
                height: 50,
                onPressed: () {
                  if (formkey1.currentState!.validate()) {
                    statements.add(
                      TransactionModel(
                        phoneNo: phoneNo.text,
                        name: name.text,
                        amount: deposit.text,
                        dateTime: DateTime.now(),
                        methodType: Type.deposit,
                        reason: "You Deposited",
                      ),
                    );

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return BankingOptions();
                        },
                      ),
                    );
                  }
                  deposit.clear();
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

enum Type {
  deposit,
  withdraw,
}

List<TransactionModel> statements = [];

class TransactionModel {
  final String? accountNo;
  final Type? methodType;
  final String? amount;
  final String? reason;
  final String? phoneNo;
  final DateTime? dateTime;
  final String? name;
  TransactionModel({
    this.accountNo,
    required this.phoneNo,
    this.name,
    this.methodType,
    this.amount,
    this.reason,
    this.dateTime,
  });
}
