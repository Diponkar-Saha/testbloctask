
part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchList extends SearchEvent {
  TextEditingController queryController = TextEditingController();
   GetSearchList({required this.queryController});
  @override
  List<Object> get props => [queryController];
}