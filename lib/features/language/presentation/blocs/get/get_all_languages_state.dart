part of 'get_all_languages_bloc.dart';

abstract class GetAllLanguagesState extends Equatable {
  const GetAllLanguagesState();
}

class GetAllLanguagesInitial extends GetAllLanguagesState {
  @override
  List<Object> get props => [];
}

class GetAllLanguagesInProgress extends GetAllLanguagesState {
  @override
  List<Object> get props => [];
}

class GetAllLanguagesSuccess extends GetAllLanguagesState {
  final List<ResponseEntity> data;
  const GetAllLanguagesSuccess({required this.data,});
  @override
  List<Object> get props => [];
}

class GetAllLanguagesFailed extends GetAllLanguagesState {
  final String message;

  const GetAllLanguagesFailed({required this.message});

  @override
  List<Object> get props => [];
}