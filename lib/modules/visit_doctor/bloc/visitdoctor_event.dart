part of 'visitdoctor_bloc.dart';

abstract class VisitdoctorEvent extends Equatable {
  const VisitdoctorEvent();

  @override
  List<Object> get props => [];
}

class GetDoctors extends VisitdoctorEvent {}

class BookDoctor extends VisitdoctorEvent {
  final Appointment appointment;
  BookDoctor({this.appointment});
  @override
  List<Object> get props => [appointment];
}
