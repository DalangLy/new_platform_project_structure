import '../../../../../app_vendor/app_vendor_export.dart';

class LanguageRecord extends ResponseEntityWithPeriod {
  final String languageId;
  final String languageCode;

  LanguageRecord(
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
    this.languageId,
    this.languageCode,
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
        );
}
