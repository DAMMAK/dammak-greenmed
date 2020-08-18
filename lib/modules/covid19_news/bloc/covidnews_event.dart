part of 'covidnews_bloc.dart';

abstract class CovidnewsEvent extends Equatable {
  const CovidnewsEvent();

  @override
  List<Object> get props => [];
}

class GetCovidNews extends CovidnewsEvent {}
