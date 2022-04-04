import '../../../../../config/config_export.dart';
import '../../../../../app_vendor/app_vendor_export.dart';
import '../../../language_export.dart';

class LanguageRecordModel extends LanguageRecord {
  LanguageRecordModel(
    String id,
    DateTime createdDate,
    DateTime? modifiedDate,
    String createdUserId,
    String? modifiedUserId,
    String periodId,
    String recordStatusTypeId,
    String reasonCodeId,
    String? description,
    DateTime? periodBeginDate,
    DateTime? periodEndDate,
    String recordStatusTypeCode,
    String reasonCodeCode,
    String? reasonCodeDescription,
    String languageId,
    String languageCode,
  ) : super(
          id,
          createdDate,
          modifiedDate,
          createdUserId,
          modifiedUserId,
          periodId,
          recordStatusTypeId,
          reasonCodeId,
          description,
          periodBeginDate,
          periodEndDate,
          recordStatusTypeCode,
          reasonCodeCode,
          reasonCodeDescription,
          languageId,
          languageCode,
        );

  factory LanguageRecordModel.fromJson({required Map<String, dynamic> json}) {
    try {
      return LanguageRecordModel(
        id(json: json),
        createdDate(json: json),
        modifiedDate(json: json),
        createdUserId(json: json),
        modifiedUserId(json: json),
        periodId(json: json,),
        recordStatusTypeId(json: json),
        reasonCodeId(json: json),
        description(json: json),
        periodBeginDate(json: json),
        periodEndDate(json: json),
        recordStatusTypeCode(json: json),
        reasonCodeCode(json: json),
        reasonCodeDescription(json: json),
        jsonNonNullableString(json: json, field: 'lid'),
        jsonNonNullableString(json: json, field: 'lcode'),
      );
    } on Failure {
      rethrow;
    } catch (e) {
      throw mappingFailedMessage<LanguageRecordModel>();
    }
  }
}
