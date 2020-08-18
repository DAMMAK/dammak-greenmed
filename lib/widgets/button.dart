import 'package:doctorappointment/utils/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Color color;
  final double width;
  final double height;
  Color textColor;
  final String text;
  final Function onPressed;
  final bool didHaveText;
  final bool didHaveIcon;
  final IconData icon;
  final double fontSize;
  final bool onSelect; // to enable the chnage of color when the button clicked

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
    this.onSelect = false,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onSelect) {
          setState(() {
            widget.color = AppColors.btnClickPrimaryColor;
            widget.textColor = Colors.white;
          });
        }
        widget.onPressed();
      },
      splashColor: AppColors.secondaryAccentColor,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.didHaveText
                  ? Text(
                      widget.text,
                      style: TextStyle(
                          color: widget.textColor,
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.w500),
                    )
                  : SizedBox(),
              SizedBox(
                width: widget.width * 0.02,
              ),
              widget.didHaveIcon
                  ? Icon(
                      widget.icon,
                      color: widget.textColor,
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
