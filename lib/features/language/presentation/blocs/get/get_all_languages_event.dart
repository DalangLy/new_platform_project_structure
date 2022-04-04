part of 'get_all_languages_bloc.dart';

abstract class GetAllLanguagesEvent extends Equatable {
  const GetAllLanguagesEvent();
}

class GetAllLanguages extends GetAllLanguagesEvent {
  @override
  List<Object> get props => [];
}