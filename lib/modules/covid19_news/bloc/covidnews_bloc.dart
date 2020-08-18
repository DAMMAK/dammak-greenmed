import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctorappointment/modules/covid19_news/model/news.dart';
import 'package:doctorappointment/modules/covid19_news/service/api_client.dart';
import 'package:equatable/equatable.dart';

part 'covidnews_event.dart';
part 'covidnews_state.dart';

class CovidnewsBloc extends Bloc<CovidnewsEvent, CovidnewsState> {
  Covid19NewClient _client = Covid19NewClient();
  @override
  CovidnewsState get initialState => CovidnewsInitial();
  @override
  Stream<CovidnewsState> mapEventToState(
    CovidnewsEvent event,
  ) async* {
    if (event is GetCovidNews) {
      yield* _mapGetGetCovidNewsToState();
    }
  }

  Stream<CovidnewsState> _mapGetGetCovidNewsToState() async* {
    yield LoadingOn();
    try {
      var response = await _client.getNews();
      yield LoadingOff();
      if (response is News) {
        yield CovidnewsSuccessful(news: response);
      } else {
        yield CovidnewsFailed();
      }
    } catch (e) {
      print(e);
    }
  }
}
