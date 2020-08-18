import 'package:doctorappointment/utils/colors.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  TextEditingController controller;
  ValueChanged<String> onChanged;
  double height;
  double width;
  String hintText;
  FocusNode focusNode;
  Color bgColor;
  final Function onSaved;
  final Function validator;
  TextInputAction inputAction;
  Function onFieldSubmitted;
  InputPassword({
    this.controller,
    this.height,
    this.onChanged,
    this.hintText,
    this.width,
    this.bgColor,
    this.onSaved,
    this.inputAction = TextInputAction.unspecified,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
  });
  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool showPassword = false;
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      height: widget.height,
      width: widget.width,
      padding: EdgeInsets.symmetric(horizontal: height * 0.01),
      decoration: BoxDecoration(
        color: widget.bgColor,
        border: Border.all(color: AppColors.inputBorderColor, width: 3.0),
        borderRadius: BorderRadius.all(
          Radius.circular(height * 0.02),
        ),
      ),
      child: Center(
        child: TextFormField(
          controller: widget.controller,
          obscureText: !showPassword,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          focusNode: widget.focusNode,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.inputAction,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
          ),
        ),
      ),
    );
  }
}
