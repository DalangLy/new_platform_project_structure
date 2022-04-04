import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core_export.dart';
import '../../language_export.dart';

class LanguagePage extends StatelessWidgetWithDialogs {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<GetAllLanguagesBloc>(context);

    return BlocListener<GetAllLanguagesBloc, GetAllLanguagesState>(
      listener: (context, state) {
        if (state is GetAllLanguagesFailed) {
          hideDLoadingDialog(context);

        }
        else if (state is GetAllLanguagesSuccess) {
          hideDLoadingDialog(context);
        }
        else if (state is GetAllLanguagesInProgress) {
          showDLoadingDialog(context);
        }
      },
      child: DScaffold(
        onBackTapped: () {
          showMyAlert(context);
        },
        breadCrumbs: <DBreadCrumb>[
          DBreadCrumb(title: 'Language', onTapped: () {}),
        ],
        body: DScaffoldBody(
          onAddTapped: () {},
          onRefreshTapped: () {
            _bloc.load();
          },
          child: BlocBuilder<GetAllLanguagesBloc, GetAllLanguagesState>(
            builder: (context, state) {
              if(state is GetAllLanguagesSuccess){
                return DDataTable(
                  data: state.data,
                  headerTitles: const [
                    'ID',
                    'Code',
                    'Created Date',
                    'Modified Date',
                    'Global Text',
                    'Culture Text',
                    'Description',
                  ],
                  valueBuilder: (entity){
                    final Language language = entity as Language;
                    return [
                      DDataTableValue('ID', language.id),
                      DDataTableValue('Code', language.code),
                      DDataTableValue('Created Date', language.createdDate.toString()),
                      DDataTableValue('Modified Date', language.modifiedDate.toString()),
                      DDataTableValue('Global Text', language.globalText.toString()),
                      DDataTableValue('Culture Text', language.cultureText.toString()),
                      DDataTableValue('Description', language.description.toString()),
                    ];
                  },
                );
              }
              return const Text('No Data');
            },
          ),
        ),
      ),
    );
  }
}