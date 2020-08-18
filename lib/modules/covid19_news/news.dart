import 'package:doctorappointment/modules/covid19_news/bloc/covidnews_bloc.dart';
import 'package:doctorappointment/modules/covid19_news/model/news.dart';
import 'package:doctorappointment/utils/display.dart';
import 'package:doctorappointment/widgets/login_dialog.dart';
import 'package:doctorappointment/widgets/platform/platform_loader.dart';
import 'package:doctorappointment/widgets/scaffold/scaffold_with_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidNews extends StatefulWidget {
  @override
  _CovidNewsState createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> {
  double width;
  double height;
  CovidnewsBloc _bloc;
  News news;
  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<CovidnewsBloc>(context);
    _bloc.add(GetCovidNews());
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return BlocConsumer<CovidnewsBloc, CovidnewsState>(
      listener: (context, state) {
        if (state is LoadingOn) {
          DialogManager(height: height, width: width)
              .showLoadingDialog(context);
        }
        if (state is LoadingOff) {
          Navigator.of(context).pop();
        }
        if (state is CovidnewsSuccessful) {
          setState(() {
            news = state.news;
          });
        }
      },
      builder: (context, state) {
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
            SizedBox(height: height * 0.03),
            _covidStat(),
          ],
        );
      },
    );
  }

  Widget covidCount({String label, String value}) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: width * 0.04,
            ),
          ),
          Text(
            value,
            style:
                TextStyle(fontWeight: FontWeight.w900, fontSize: width * 0.04),
          )
        ],
      ),
    );
  }

  Widget _covidStat() {
    return Container(
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
          Text(
            "Nigeria",
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height * 0.007,
          ),
          covidCount(
              label: "total cases:",
              value: news != null
                  ? DisplayUtil.formatNumber(news.cases.total).toString()
                  : ""),
          covidCount(
              label: "total deaths:",
              value: news != null
                  ? DisplayUtil.formatNumber(news.deaths.total).toString()
                  : ""),
          covidCount(
              label: "total recovered:",
              value: news != null
                  ? DisplayUtil.formatNumber(news.cases.recovered).toString()
                  : "")
        ],
      ),
    );
  }
}
