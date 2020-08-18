import 'package:doctorappointment/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  Color color;
  final double height;
  final String text;
  final Widget image;
  Color textColor;
  final Function onPressed;
  HomeButton({
    this.color = AppColors.homeButtonColor,
    this.height = 100.0,
    this.text,
    this.image,
    this.textColor = AppColors.btnTextColor,
    this.onPressed,
  });

  @override
  _HomeButtonState createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.color = AppColors.btnClickPrimaryColor;
          widget.textColor = Colors.white;
        });
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            widget.color = AppColors.homeButtonColor;
            widget.textColor = AppColors.btnTextColor;
          });
        });
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 200),
        height: widget.height,
        padding: EdgeInsets.only(left: width * 0.07),
        margin: EdgeInsets.only(bottom: width * 0.07),
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(width * 0.03),
          ),
        ),
        child: Row(
          children: [
            widget.image,
            SizedBox(
              width: width * 0.08,
            ),
            Text(
              widget.text,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: width * 0.05,
                color: widget.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
