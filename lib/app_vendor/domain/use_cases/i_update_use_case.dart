import '../../app_vendor_export.dart';

abstract class IUpdateUseCase{
  Future<ResponseEntity> call({required RequestEntity entity,});
}