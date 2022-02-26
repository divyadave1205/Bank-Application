import 'package:flutter/material.dart';
import 'package:my_bank/main.dart';
import 'package:my_bank/screens/auth/create.dart';
import 'package:my_bank/screens/auth/log_in.dart';
import 'package:my_bank/screens/option/statement.dart';
import 'package:my_bank/utilities/color_utilities.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.white,
      body: Center(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            print(
              balance.text,
            );
            final index = dataList
                .indexWhere((element) => element.phoneNo == phoneNo1.text);
            if (dataList.any(
              (de) => de.accountNo == dataList[index].accountNo,
            )) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Account No. : ${dataList[index].accountNo}",
                      style: styles(),
                    ),
                    Text(
                      "Balance         : ${dataList[index].balance}",
                      style: styles(),
                    ),
                    Text(
                      "Full name      : ${dataList[index].fullname}",
                      style: styles(),
                    ),
                    Text(
                      "Phone no.     : ${dataList[index].phoneNo}",
                      style: styles(),
                    ),
                    Text(
                      "Pin                 : ${dataList[index].pin}",
                      style: styles(),
                    ),
                    Text(
                      "User Name   : ${dataList[index].userName}",
                      style: styles(),
                    ),
                    Text(
                      "Email Address: ${dataList[index].emailAddress}",
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
