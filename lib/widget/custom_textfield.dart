import 'package:flutter/material.dart';
import 'package:my_bank/utilities/color_utilities.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? color;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  CustomTextField(
      {Key? key,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      required this.color,
      this.validator})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: TextFormField(
        style: TextStyle(
          color: ColorUtilities.white,
        ),
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: Icon(
            widget.suffixIcon,
            color: ColorUtilities.white,
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: ColorUtilities.white,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorUtilities.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: widget.color,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: ColorUtilities.white,
            fontSize: 18,
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
