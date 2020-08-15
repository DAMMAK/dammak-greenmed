import 'package:doctorappointment/widgets/scaffold/scaffold_with_nav.dart';
import 'package:flutter/material.dart';

class CovidNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ScaffoldWithNav(
      children: [
        SizedBox(height: height * 0.03),
        Text(
          "Covid 19 news\nand updates",
          style: TextStyle(
            fontSize: width * 0.06,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: height * 0.02),
        Container(
          // height: height * 0.1,
          padding: EdgeInsets.symmetric(
              vertical: height * 0.025, horizontal: width * 0.06),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.035),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nigeria"),
              covidCount(label: "total cases:", value: "222,333,44"),
              covidCount(label: "total deaths:", value: "222,333,44"),
              covidCount(label: "total recovered:", value: "222,333,44")
            ],
          ),
        )
      ],
    );
  }

  Widget covidCount({String label, String value}) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value)],
      ),
    );
  }
}
