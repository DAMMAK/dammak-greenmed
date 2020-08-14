import 'package:doctorappointment/utils/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final Color textColor;
  final String text;
  final Function onPressed;
  final bool didHaveText;
  final bool didHaveIcon;
  final IconData icon;
  final double fontSize;

  Button({
    this.color = AppColors.primaryColor,
    this.height = 50,
    @required this.width,
    this.textColor = Colors.white,
    this.text,
    @required this.onPressed,
    this.didHaveIcon = false,
    this.didHaveText = true,
    this.icon,
    this.fontSize = 17.0,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      splashColor: AppColors.secondaryAccentColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              didHaveText
                  ? Text(
                      text,
                      style: TextStyle(
                          color: textColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w500),
                    )
                  : SizedBox(),
              SizedBox(
                width: width * 0.02,
              ),
              didHaveIcon
                  ? Icon(
                      icon,
                      color: textColor,
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
