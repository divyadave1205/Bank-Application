import 'package:flutter/material.dart';
import 'package:my_bank/screens/auth/create.dart';
import 'package:my_bank/screens/auth/log_in.dart';
import 'package:my_bank/utilities/color_utilities.dart';
import 'package:my_bank/widget/custom_elevated_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBank(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyBank extends StatefulWidget {
  const MyBank({Key? key}) : super(key: key);

  @override
  _MyBankState createState() => _MyBankState();
}

class _MyBankState extends State<MyBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtilities.black,
        centerTitle: true,
        title: Text(
          "BANKING",
          style: TextStyle(
            color: ColorUtilities.white,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: ColorUtilities.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              buttonName: "LOG IN",
              color: ColorUtilities.black,
              height: 55,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Login();
                }));
              },
              width: 150,
            ),
            SizedBox(
              height: 30,
            ),
            CustomElevatedButton(
              buttonName: "CREATE",
              color: ColorUtilities.black,
              height: 55,
              onPressed: () {
                accountNo = "";
                name.clear();
                phoneNo.clear();
                emailAddress.clear();
                pin.clear();
                balance.clear();
                userName.clear();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Create();
                }));
              },
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}

List<UserModel> dataList = [];

class UserModel {
  final int? index;
  final String? fullname;
  final String? userName;
  final String? balance;
  final String? phoneNo;
  final String? pin;
  final String? accountNo;
  final String? emailAddress;
  UserModel({
    required this.index,
    this.emailAddress,
    this.fullname,
    this.userName,
    this.balance,
    this.phoneNo,
    this.pin,
    this.accountNo,
  });
}
