part of 'visitdoctor_bloc.dart';

abstract class VisitdoctorState extends Equatable {
  const VisitdoctorState();

  @override
  List<Object> get props => [];
}

class VisitdoctorInitial extends VisitdoctorState {}

class VisitdoctorSuccessful extends VisitdoctorState {
  DoctorTabs tabs;
  VisitdoctorSuccessful({this.tabs});
  @override
  List<Object> get props => [tabs];
}

class VisitdoctorFailed extends VisitdoctorState {}

class LoadingOn extends VisitdoctorState {}

class LoadingOff extends VisitdoctorState {}

/*
* BLOC for to Book Time with doctor
*
*/
class BookTimeSuccessful extends VisitdoctorState {}

class BookTimeFailed extends VisitdoctorState {}
