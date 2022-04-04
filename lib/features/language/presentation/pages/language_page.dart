import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core_export.dart';
import '../../language_export.dart';


class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAllLanguagesBloc, GetAllLanguagesState>(
      listener: (context, state) {
        if(state is GetAllLanguagesFailed){
          print(state.message);
        }
        else if(state is GetAllLanguagesSuccess){
          print(state.data.length);
        }
      },
      child: DScaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<GetAllLanguagesBloc>(context).load();
            },
            child: const Text('Get All Languages'),
          ),
        ),
      ),
    );
  }
}
