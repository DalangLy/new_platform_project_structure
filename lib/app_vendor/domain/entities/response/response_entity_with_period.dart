import 'response_entity.dart';

abstract class ResponseEntityWithPeriod extends ResponseEntity {
  final String periodId;
  final String recordStatusTypeId;
  final String reasonCodeId;
  final String? description;
  final DateTime? periodBeginDate;
  final DateTime? periodEndDate;
  final String recordStatusTypeCode;
  final String reasonCodeCode;
  final String? reasonCodeDescription;

  ResponseEntityWithPeriod(
    String id,
    DateTime createdDate,
    DateTime? modifiedDate,
    String createdUserId,
    String? modifiedUserId,
      this.periodId,
      this.recordStatusTypeId,
      this.reasonCodeId,
      this.description,
      this.periodBeginDate,
      this.periodEndDate,
      this.recordStatusTypeCode,
      this.reasonCodeCode,
      this.reasonCodeDescription,
  ) : super(
          id,
          createdDate,
          modifiedDate,
          createdUserId,
          modifiedUserId,
        );
}
