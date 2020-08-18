import 'package:doctorappointment/modules/visit_doctor/bloc/visitdoctor_bloc.dart';
import 'package:doctorappointment/modules/visit_doctor/models/doctor_tabs.dart';
import 'package:doctorappointment/modules/visit_doctor/widgets/tabs.dart';
import 'package:doctorappointment/widgets/login_dialog.dart';
import 'package:doctorappointment/widgets/scaffold/scaffold_with_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDoctor extends StatefulWidget {
  @override
  _BookDoctorState createState() => _BookDoctorState();
}

class _BookDoctorState extends State<BookDoctor> {
  VisitdoctorBloc _bloc;
  DoctorTabs _doctorTabs;
  DialogManager _dialogManager;
  Widget tabs = SizedBox();
  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<VisitdoctorBloc>(context);
    _bloc.add(GetDoctors());
    _doctorTabs = DoctorTabs();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    _dialogManager = DialogManager(height: height, width: width);

    return BlocConsumer<VisitdoctorBloc, VisitdoctorState>(
      listener: (context, state) {
        if (state is VisitdoctorSuccessful) {
          _doctorTabs = state.tabs;
        }
        if (state is LoadingOn) {
          _dialogManager.showLoadingDialog(context);
        }
        if (state is LoadingOff) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return ScaffoldWithNav(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "Choose\na Doctor",
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            _doctorTabs.tabs != null
                ? DoctorsTab(
                    tabs: _doctorTabs,
                  )
                : SizedBox(),
          ],
        );
      },
    );
  }
}
