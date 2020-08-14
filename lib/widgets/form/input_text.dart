import 'package:doctorappointment/utils/colors.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  TextEditingController controller;
  ValueChanged<String> onchanged;
  String hintText;
  Color bgColor;
  double height;
  bool didHaveIcon;
  IconData icon;
  TextInputType keyboardType;
  InputText({
    this.controller,
    this.onchanged,
    this.hintText,
    this.bgColor,
    this.height,
    this.didHaveIcon = false,
    this.icon,
    this.keyboardType = TextInputType.text,
  });
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: AppColors.inputBorderColor, width: 3.0),
        borderRadius: BorderRadius.all(
          Radius.circular(_height * 0.019),
        ),
      ),
      child: Center(
        child: TextFormField(
          onChanged: onchanged,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
