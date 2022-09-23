import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testbloctask/model/search_response.dart';

import '../../resource/api_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    final ApiRepository _apiRepository = ApiRepository();


    on<GetSearchList>((event, emit) async {
      try {
        emit(SearchLoading());
        final mList = await _apiRepository.fetchCovidList(event.queryController.text);
        emit(SearchLoaded(mList));
        if (mList.error != null) {
          emit(SearchError(mList.error));
        }
      } on NetworkError {
        emit(const SearchError("Failed to fetch data. is your device online?"));
      }
    });
  }
}