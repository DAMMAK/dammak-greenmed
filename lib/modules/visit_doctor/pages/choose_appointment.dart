import 'package:doctorappointment/modules/authentication/widgets/user_data.dart';
import 'package:doctorappointment/modules/visit_doctor/bloc/visitdoctor_bloc.dart';
import 'package:doctorappointment/modules/visit_doctor/models/appointment.dart';
import 'package:doctorappointment/modules/visit_doctor/models/doctor.dart';
import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/utils/colors.dart';
import 'package:doctorappointment/widgets/button.dart';
import 'package:doctorappointment/widgets/scaffold/scaffold_with_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class ChooseDate extends StatefulWidget {
  Doctor doctor;

  ChooseDate({this.doctor});

  @override
  _ChooseDateState createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate>
    with SingleTickerProviderStateMixin {
  double height;
  double width;
  var starTime;
  var endTime;
  var chooseStartTime = 0;
  var chooseEndTime = 0;
  Appointment _appointment;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    // setState(() {
    //   _selectedEvents = events;
    // });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    starTime = widget.doctor.workTimeStart.split(":")[0];
    endTime = widget.doctor.workTimeEnd.split(":")[0];
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return BlocConsumer<VisitdoctorBloc, VisitdoctorState>(
      listener: (context, state) {
        if (state is BookTimeSuccessful) {
          Navigator.of(context).pushNamed(Routes.bookResponse);
        }
      },
      builder: (context, state) {
        return ScaffoldWithNav(
          children: [
            SizedBox(height: height * 0.06),
            Text(
              "Choose a date\n& time period",
              style: TextStyle(
                fontSize: width * 0.07,
                fontWeight: FontWeight.w900,
              ),
            ),
            _buildTableCalendarWithBuilders(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _timeToChoose(),
                    SizedBox(height: height * 0.06),
                    Button(
                      didHaveText: true,
                      didHaveIcon: false,
                      width: width * 0.9,
                      height: height * 0.07,
                      text: "Book",
                      fontSize: width * 0.06,
                      onPressed: () {
                        print(
                            "choosen time: $chooseStartTime - $chooseEndTime");
                        _appointment = Appointment(
                          userID: 1,
                          doctorID: 3,
                          startTime: chooseStartTime.toString(),
                          endTime: chooseStartTime.toString(),
                        );
                        BlocProvider.of<VisitdoctorBloc>(context)
                            .add(BookDoctor(appointment: _appointment));
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _timeToChoose() {
    return Wrap(
      children: [
        for (int i = int.parse(starTime); i < int.parse(endTime); i++)
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Button(
              didHaveText: true,
              didHaveIcon: false,
              width: width * 0.2,
              onSelect: true,
              textColor: Colors.black,
              color: AppColors.homeButtonColor,
              text: "$i - ${i + 1}",
              fontSize: width * 0.05,
              onPressed: () {
                if (chooseStartTime == 0) chooseStartTime = i;
                chooseEndTime = i + 1;
              },
            ),
          ),
      ],
    );
  }

  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'en_US',
      calendarController: _calendarController,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekdayStyle:
            TextStyle().copyWith(color: Colors.black, fontSize: width * 0.05),
        weekendStyle: TextStyle().copyWith(
            color: Colors.grey.withOpacity(0.6), fontSize: width * 0.05),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle:
            TextStyle().copyWith(color: Colors.black, fontSize: width * 0.05),
        weekendStyle: TextStyle().copyWith(
            color: Colors.grey.withOpacity(0.6), fontSize: width * 0.05),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              decoration: BoxDecoration(
                  color: AppColors.btnClickPrimaryColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(width * 0.03))),
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle()
                    .copyWith(fontSize: width * 0.05, color: Colors.white),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        // dayBuilder: (context, date, events) {
        //   return Container(
        //     child: Text(date.day.toString()),
        //   );
        // },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }
}
