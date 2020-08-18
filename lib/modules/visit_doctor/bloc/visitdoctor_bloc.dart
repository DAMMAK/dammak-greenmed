import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctorappointment/modules/visit_doctor/models/appointment.dart';
import 'package:doctorappointment/modules/visit_doctor/models/doctor_tabs.dart';
import 'package:doctorappointment/modules/visit_doctor/service/appointment_client.dart';
import 'package:doctorappointment/modules/visit_doctor/service/visit_doctor_api_client.dart';
import 'package:equatable/equatable.dart';

part 'visitdoctor_event.dart';
part 'visitdoctor_state.dart';

class VisitdoctorBloc extends Bloc<VisitdoctorEvent, VisitdoctorState> {
  VisitDoctorClient _client = VisitDoctorClient();
  AppointmentClient _appointmentClient = AppointmentClient();

  @override
  VisitdoctorState get initialState => VisitdoctorInitial();

  @override
  Stream<VisitdoctorState> mapEventToState(
    VisitdoctorEvent event,
  ) async* {
    if (event is GetDoctors) {
      yield* mapGetDoctorEventToState();
    } else if (event is BookDoctor) {
      yield* mapBookTimeEventToState(event);
    }
  }

  Stream<VisitdoctorState> mapGetDoctorEventToState() async* {
    yield LoadingOn();
    try {
      DoctorTabs response = await _client.getDoctors();
      yield LoadingOff();
      yield VisitdoctorSuccessful(tabs: response);
    } catch (e) {
      print(e);
    }
  }

  Stream<VisitdoctorState> mapBookTimeEventToState(BookDoctor event) async* {
    yield LoadingOn();
    try {
      var response =
          await _appointmentClient.bookAppointment(event.appointment);
      yield LoadingOff();
      yield BookTimeSuccessful();
    } catch (e) {
      print(e);
    }
  }
}
