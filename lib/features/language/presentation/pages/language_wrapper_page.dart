import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../language_export.dart';


class LanguageWrapperPage extends StatelessWidget {
  const LanguageWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllLanguagesBloc(GetAllLanguagesUseCase(LanguageRepository(LanguageRemoteDataSource(Dio())))),
      child: const LanguagePage(),
    );
  }
}
