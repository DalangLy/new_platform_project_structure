import 'response_entity.dart';

abstract class ResponseEntityWithCodeAndDesc extends ResponseEntity {
  final String code;
  final String? description;

  ResponseEntityWithCodeAndDesc(
    String id,
    DateTime createdDate,
    DateTime? modifiedDate,
    String createdUserId,
    String? modifiedUserId,
      this.code,
      this.description,
  ) : super(
          id,
          createdDate,
          modifiedDate,
          createdUserId,
          modifiedUserId,
        );
}
