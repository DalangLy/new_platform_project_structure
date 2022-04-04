import '../../../../../app_vendor/app_vendor_export.dart';
import '../../../language_export.dart';

class Language extends ResponseEntityWithCodeAndDesc {
  final String globalText;
  final String cultureText;
  final List<LanguageRecord> languageRecords;

  Language(
    String id,
    DateTime createdDate,
    DateTime? modifiedDate,
    String createdUserId,
    String? modifiedUserId,
    String code,
    String? description,
    this.globalText,
    this.cultureText,
    this.languageRecords,
  ) : super(
          id,
          createdDate,
          modifiedDate,
          createdUserId,
          modifiedUserId,
          code,
          description,
        );
}
