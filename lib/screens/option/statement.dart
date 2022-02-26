import 'package:flutter/material.dart';
import 'package:my_bank/screens/auth/create.dart';
import 'package:my_bank/screens/option/deposit.dart';
import 'package:my_bank/utilities/color_utilities.dart';

class Statement extends StatefulWidget {
  const Statement({Key? key}) : super(key: key);

  @override
  _StatementState createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.white,
      body: Center(
        child: ListView.builder(
          itemCount: statements.length,
          itemBuilder: (BuildContext context, int index) {
            print(
              balance.text,
            );
            if (statements.any(
              (de) => de.accountNo == statements[index].accountNo,
            )) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Account No. : ${statements[index].accountNo}",
                      style: styles(),
                    ),
                    Text(
                      "Amount         : ${statements[index].amount}",
                      style: styles(),
                    ),
                    Text(
                      "Date Time      : ${statements[index].dateTime}",
                      style: styles(),
                    ),
                    Text(
                      "Reason           : ${statements[index].reason}",
                      style: styles(),
                    ),
                    Text(
                      "Total Balance       : ${statements[index].methodType == Type.withdraw ? int.parse(balance.text) - int.parse(statements[index].amount!) : int.parse(balance.text) + int.parse(statements[index].amount!)}",
                      style: styles(),
                    ),
                    Text(
                      "------------------------------------------------",
                      style: styles(),
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

styles() {
  return TextStyle(
    color: ColorUtilities.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}
