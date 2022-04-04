import '../../app_vendor_export.dart';

abstract class IGetByIdUseCase{
  Future<ResponseEntity> call({required String id,});
}