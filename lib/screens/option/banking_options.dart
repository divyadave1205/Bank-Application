import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_bank/main.dart';
import 'package:my_bank/screens/auth/log_in.dart';
import 'package:my_bank/screens/option/deposit.dart';
import 'package:my_bank/screens/option/details.dart';
import 'package:my_bank/screens/option/statement.dart';
import 'package:my_bank/screens/option/withdraw.dart';
import 'package:my_bank/utilities/color_utilities.dart';

class BankingOptions extends StatefulWidget {
  const BankingOptions({Key? key}) : super(key: key);

  @override
  _BankingOptionsState createState() => _BankingOptionsState();
}

class _BankingOptionsState extends State<BankingOptions> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorUtilities.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Choose What You Want",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: ColorUtilities.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              CustomContainer(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Details();
                  }));
                },
                mainAxisAlignment: MainAxisAlignment.start,
                option: "Details",
              ),
              CustomContainer(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Statement();
                  }));
                },
                mainAxisAlignment: MainAxisAlignment.end,
                
                option: "Statement",
              ),
              CustomContainer(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Withdraw();
                  }));
                },
                mainAxisAlignment: MainAxisAlignment.start,
                option: "Withdraw",
              ),
              CustomContainer(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Deposit();
                  }));
                },
                mainAxisAlignment: MainAxisAlignment.end,
                option: "Deposit",
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Login();
                  }), (route) => route == MyBank());
                  Navigator.of(context).pop();
                },
                child: Text(
                  "LOG OUT",
                  style: TextStyle(
                    color: ColorUtilities.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatefulWidget {
  final String? option;
  final MainAxisAlignment? mainAxisAlignment;
  final void Function()? onTap;
  const CustomContainer({
    Key? key,
    this.option,
    this.mainAxisAlignment,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment!,
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: EdgeInsets.all(10),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorUtilities.black,
            ),
            child: Center(
              child: Text(
                widget.option!,
                style: TextStyle(
                  color: ColorUtilities.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
