import 'package:doctorappointment/modules/visit_doctor/models/doctor_tabs.dart';
import 'package:doctorappointment/modules/visit_doctor/widgets/doctor_card.dart';
import 'package:doctorappointment/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorsTab extends StatefulWidget {
  DoctorTabs tabs;
  DoctorsTab({this.tabs});

  @override
  _DoctorsTabState createState() => _DoctorsTabState();
}

class _DoctorsTabState extends State<DoctorsTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // color: Colors.orange,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: AppColors.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5.0,
            labelColor: Colors.black,
            labelStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.ubuntu().fontFamily),
            tabs: tabs
                .map((e) => Tab(
                      text: e.name,
                    ))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: tabs
                    .map((e) => ListView.builder(
                        itemCount: e.doctors.length,
                        itemBuilder: (BuildContext context, index) {
                          return DoctorCard(
                            doctor: e.doctors[index],
                          );
                        }))
                    .toList()),
          )
        ],
      ),
    );
  }
}
