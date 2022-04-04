import '../../../../../app_vendor/app_vendor_export.dart';
import '../../../language_export.dart';
import '../../../../../config/config_export.dart';

class LanguageModel extends Language {
  LanguageModel(
    String id,
    DateTime createdDate,
    DateTime? modifiedDate,
    String createdUserId,
    String? modifiedUserId,
    String code,
    String? description,
    String globalText,
    String cultureText,
    List<LanguageRecord> languageRecords,
  ) : super(
          id,
          createdDate,
          modifiedDate,
          createdUserId,
          modifiedUserId,
          code,
          description,
          globalText,
          cultureText,
          languageRecords,
        );

  factory LanguageModel.fromJson({required Map<String, dynamic> json}) {
    try {
      return LanguageModel(
        id(json: json),
        createdDate(json: json),
        modifiedDate(json: json),
        createdUserId(json: json),
        modifiedUserId(json: json),
        code(json: json),
        description(json: json),
        jsonNonNullableString(json: json, field: 'gtext'),
        jsonNonNullableString(json: json, field: 'ctext'),
        jsonToListEntity(
          json: json,
          field: 'lrecords',
          eachJson: (json) {
            return LanguageRecordModel.fromJson(json: json);
          },
        ),
      );
    } on Failure {
      rethrow;
    } catch (e) {
      throw mappingFailedMessage<LanguageModel>();
    }
  }
}
