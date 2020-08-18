part of 'covidnews_bloc.dart';

abstract class CovidnewsState extends Equatable {
  const CovidnewsState();

  @override
  List<Object> get props => [];
}

class CovidnewsInitial extends CovidnewsState {}

class CovidnewsSuccessful extends CovidnewsState {
  final News news;
  CovidnewsSuccessful({this.news});
  @override
  List<Object> get props => [news];
}

class CovidnewsFailed extends CovidnewsState {}

class LoadingOff extends CovidnewsState {}

class LoadingOn extends CovidnewsState {}
